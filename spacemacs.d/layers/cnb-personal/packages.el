;;; packages.el --- cnb-personal. Personal settings
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baibell.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;==============================================
;; elfeed configuration
;;==============================================
(setq rmh-elfeed-org-files
      (list
       (expand-file-name "elfeed.org"
                         dotspacemacs-directory)
       (file-truename "~/Dropbox/home-config/feeds/feeds.org")))


(with-eval-after-load 'elfeed
  (setq org-planning-line-re "") ;; elfeed crashes without this.
  (defface urgent-elfeed-entry
    '((t :foreground "#f77"))
    "Marks an urgent Elfeed entry.")
  (push '(urgent urgent-elfeed-entry)
        elfeed-search-face-alist)

  (setq elfeed-goodies/entry-pane-position 'right
        elfeed-goodies/entry-pane-size 0.5
        url-queue-parallel-processes 3
        elfeed-search-filter "@6-months-ago +unread "))

;;==============================================
;; Remove Unnecessary Clutter
;;==============================================

(setq use-file-dialog nil)
(setq use-dialog-box nil)

;;==============================================
;; Rainbow mode
;;==============================================
(setq rainbow-html-colors t)
(setq rainbow-x-colors t)

;;==============================================
;; prog-mode configuration
;;==============================================
(add-hook 'prog-mode-hook #'fci-mode)      ;; Indicate fill column.
(add-hook 'prog-mode-hook #'rainbow-mode)

;;==============================================
;; source control configuration
;;==============================================
(add-hook 'after-init-hook
          (lambda ()
            (setq-default git-magit-status-fullscreen t)
            (global-git-commit-mode t)))


;;==============================================
;; RECENTF configuration
;;==============================================
(with-eval-after-load 'recentf
  ;; Files to ignore in recent files.
  (add-to-list 'recentf-exclude "~$")
  (add-to-list 'recentf-exclude "tmp")
  (add-to-list 'recentf-exclude "/ssh:")
  (add-to-list 'recentf-exclude "/sudo:")
  (add-to-list 'recentf-exclude "TAGS")
  (add-to-list 'recentf-exclude "/\\.git/.*\\'")
  (add-to-list 'recentf-exclude recentf-save-file)

  ;; Because .emacs.d is a symlink to dotfiles/emacs.d a file can have two
  ;; names so we also need to ignore the one in dotfiles.
  (add-to-list 'recentf-exclude (file-truename "~/dotfiles/emacs.d/elpa"))
  (add-to-list 'recentf-exclude
               (file-truename "~/dotfiles/emacs.d/.cache/")))


;;==============================================
;; DIRED configuration
;;==============================================
(setq dired-listing-switches "-alhG --group-directories-first")

;; Preview files in dired.
(use-package peep-dired
  :defer t)

(with-eval-after-load 'dired
  (evil-define-key 'normal dired-mode-map
    (kbd "P") 'peep-dired)

  (evil-define-key 'normal peep-dired-mode-map
    (kbd "<SPC>") 'peep-dired-scroll-page-down
    (kbd "C-<SPC>") 'peep-dired-scroll-page-up
    (kbd "<backspace>") 'peep-dired-scroll-page-up
    (kbd "j") 'peep-dired-next-file
    (kbd "k") 'peep-dired-prev-file)

  (add-hook 'peep-dired-hook #'evil-normalize-keymaps))

;;==============================================
;; IBUFFER configuration
;;==============================================
(setq ibuffer-show-empty-filter-groups nil)

;;==============================================
;; RUBY configuration
;;==============================================

(use-package rubocop
  :ensure t
  :commands rubocop-mode
  :diminish rubocop-mode)

(setq ruby-version-manager 'rvm)

(with-eval-after-load 'hideshow
  (add-to-list 'hs-special-modes-alist
               `(ruby-mode
                 ,(rx (or "def" "class" "module" "{" "[")) ; Block start
                 ,(rx (or "}" "]" "end"))                  ; Block end
                 ,(rx (or "#" "=begin"))                   ; Comment start
                 ruby-forward-sexp nil)))

(defun cnb/ruby-setup ()
  (rvm-activate-corresponding-ruby)
  (superword-mode)
  (hs-minor-mode)


  ;;(setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")
  (setq imenu-generic-expression
        '(("Methods"  "^\\( *\\(def\\) +.+\\)" 1)
          ("Examples" "^\\( *\\(its?\\|specify\\|example\\|describe\\|context\\|feature\\|scenario\\) +.+\\)" 1))))

(add-hook 'ruby-mode-hook #'cnb/ruby-setup t)

;;(eval-after-load "rubocop" '(diminish 'rubocop-mode))



;;==============================================
;; CLOJURE configuration
;;==============================================

(setq cider-auto-select-error-buffer nil)


;;==============================================
;; ORG configuration
;;==============================================

(with-eval-after-load 'org
  (require 'ob-tangle)
  (setq org-directory "~/Dropbox/org/")
  (setq org-agenda-files
        (list (concat org-directory "personal.org")
              (concat org-directory "kwela.org")
              (concat org-directory "notes.org")))
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "STARTED(n)" "|" "DONE(d!/!)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

  ;; Allow refiling to any agenda file.
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))

  (setq org-capture-templates
        '(("t" "todo" entry (file+headline (concat org-directory "personal.org") "Tasks")
           "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

  ;; Allow refile to create parent tasks with confirmation
  ;;(setq org-refile-allow-creating-parent-nodes (quote confirm))
  )



(add-hook
 'after-save-hook
 #'executable-make-buffer-file-executable-if-script-p)

;; From http://www.emacswiki.org/emacs-en/ToggleWindowSplit
(defun cnb/toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
  Assumes that the frame is only split into two. "
  (interactive)
  (unless (= (length (window-list)) 2)
    (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other win twice
    (switch-to-buffer nil))) ; restore the orig  win in this part of the frame

;; Never lose the cursor again.
(use-package beacon
  :diminish beacon-mode
  :commands beacon-mode)
 
(define-key ctl-x-4-map "t" #'cnb/toggle-frame-split)
(add-hook
 'after-init-hook (lambda ()
                    (progn
                      (spacemacs/toggle-evil-cleverparens-on)
                      (setq beacon-blink-duration 1.0)
                      (beacon-mode))))

(use-package crosshairs
  :commands flash-crosshairs
  :bind (("<f11>" . flash-crosshairs)))


(setq-default
 sentence-end-double-space t
 js2-basic-offset 2
 js-indent-level 2

 ;; Use a visible bell instead of a beep.
 visible-bell t

 ;; Always start a new tags list.
 tags-add-tables nil

 ;; When opening files follow all symbolic links.
 find-file-visit-truename t

 ;; I've got some TAGS files that are nearly 20MB in size.
 large-file-warning-threshold 20000000

 ;; Powerline config
 ;;powerline-default-separator 'arrow

 imenu-auto-rescan t

 ;;browse-url-browser-function 'browse-url-firefox
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "chromium-browser"

 ;; C-l first position to top.
 recenter-positions '(top middle bottom))

(global-hl-line-mode 0)

(add-to-list
 'display-buffer-alist
 `(,(rx bos "*rspec-compilation*" eos)
   (display-buffer-reuse-window)
   (reusable-frames . t)))

(mouse-avoidance-mode 'exile)
