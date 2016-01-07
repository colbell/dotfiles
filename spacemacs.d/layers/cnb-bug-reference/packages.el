;;; packages.el --- Bug Reference Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baibell.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar cnb-bug-reference-packages '(bug-reference))

;; List of packages to exclude.
(setq cnb-bug-reference-excluded-packages '())

(defun cnb-bug-reference/init-bug-reference ()
  (use-package bug-reference
    :demand

    :init
    (progn
      (add-hook #'text-mode-hook #'bug-reference-mode)
      (add-hook #'magit-log-mode-hook #'bug-reference-mode)
      ;; Force Magit log mode to load .dir-locals.el.
      (add-hook #'magit-log-mode-hook #'hack-dir-local-variables-non-file-buffer)
      (add-hook #'prog-mode-hook #'bug-reference-prog-mode))))
