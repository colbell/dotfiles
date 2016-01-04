;;; packages.el --- muttrc Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baibell.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar cnb-muttrc-packages '(muttrc-mode))

;; List of packages to exclude.
(setq cnb-muttrc-excluded-packages '())

(defun cnb-muttrc/init-muttrc-mode ()
  (use-package muttrc-mode
    :defer t
    :mode ("muttrc" . muttrc-mode)))
