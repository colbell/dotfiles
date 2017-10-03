;;; packages.el --- Shrink white space Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baibell.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq cnb-shrink-whitespace-packages '(shrink-whitespace))

(defun cnb-shrink-whitespace/init-shrink-whitespace ()
  (use-package shrink-whitespace
    :defer t
    :bind (("M-SPC" . shrink-whitespace))))
