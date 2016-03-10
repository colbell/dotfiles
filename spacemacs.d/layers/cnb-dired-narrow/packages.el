;;; packages.el --- Visual Bookmarks Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baibell.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar cnb-dired-narrow-packages '(dired-hacks-utils dired-narrow))

;; List of packages to exclude.
(setq cnb-bm-excluded-packages '())

(defun cnb-dired-narrow/init-dired-hacks-utils ()
  (use-package dired-hacks-utils
    :ensure t))
 
(defun cnb-dired-narrow/init-dired-narrow ()
  (use-package dired-narrow
    :ensure t
    :commands (dired-narrow)
    :bind (:map dired-mode-map
                ("/" . dired-narrow))
    :init
    (progn
      (with-eval-after-load 'dired
        (evil-define-key 'normal dired-mode-map "/" 'dired-narrow)))))
