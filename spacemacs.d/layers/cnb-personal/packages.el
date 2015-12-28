;;; packages.el --- cnb-personal. Personal settings
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baiebll.org>
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
;; prog-mode config configuration
;;==============================================
(add-hook 'prog-mode-hook 'fci-mode) ;; Indicate fill column.

;;==============================================
;; source control configuration
;;==============================================
(add-hook 'after-init-hook
          (lambda ()
            (setq-default git-magit-status-fullscreen t)
            (global-git-commit-mode t)))

;;==============================================
;; recentf configuration
;;==============================================
(with-eval-after-load 'recentf
  ;; Files to ignore in recent files.
  (add-to-list 'recentf-exclude "~$")
  (add-to-list 'recentf-exclude "tmp")
  (add-to-list 'recentf-exclude "/ssh:")
  (add-to-list 'recentf-exclude "/sudo:")
  (add-to-list 'recentf-exclude "TAGS")
  (add-to-list 'recentf-exclude "/\\.git/.*\\'")

  ;; Because .emacs.d is a symlink to dotfiles/emacs.d a file can have two
  ;; names so we also need to ignore the one in dotfiles.
  (add-to-list 'recentf-exclude (file-truename "~/dotfiles/emacs.d/elpa"))
  (add-to-list 'recentf-exclude
               (file-truename "~/dotfiles/emacs.d/.cache/")))

;;==============================================
;; ruby configuration
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
