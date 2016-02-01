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
;; RUBY configuration
;;==============================================

(setq ruby-version-manager 'rvm)

(defun cnb/ruby-setup ()
  (rvm-activate-corresponding-ruby)
  (superword-mode)
  (setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")
  (setq imenu-generic-expression
        '(("Methods"  "^\\( *\\(def\\) +.+\\)" 1)
          ("Examples" "^\\( *\\(its?\\|specify\\|example\\|describe\\|context\\|feature\\|scenario\\) +.+\\)" 1))))

(add-hook 'ruby-mode-hook #'cnb/ruby-setup t)

(eval-after-load "rubocop" '(diminish 'rubocop-mode))


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
