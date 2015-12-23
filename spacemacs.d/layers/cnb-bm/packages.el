;;; packages.el --- cnb-bm (Visual Bookmarks) Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baiebll.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar cnb-bm-packages '(bm))

;; List of packages to exclude.
(setq cnb-bm-excluded-packages '())

(defun cnb-bm/init-bm ()
  (use-package bm
    :commands (bm-repository-load bm-buffer-restore bm-buffer-save
                                  bm-repository-save bm-buffer-save-all
                                  bm-cycle-all-buffers bm-toggle
                                  bm-show-all bm-next bm-previous)
    :defer t

    :init
    (progn
      (setq bm-restore-repository-on-load t)
      (setq bm-repository-file (expand-file-name "bm-repository"
                                                 spacemacs-cache-directory))
      (setq bm-repository-size 1024)
      (setq bm-cycle-all-buffers nil)
      (setq-default bm-buffer-persistence t)
      ;; (setq bm-highlight-style 'bm-highlight-only-line)
      ;; (setq bm-highlight-style 'bm-highlight-line-and-fringe)
      (setq bm-highlight-style 'bm-highlight-only-fringe)

      (evil-leader/set-key "oba" 'bm-show-all)
      (evil-leader/set-key "obn" 'bm-next)
      (evil-leader/set-key "obp" 'bm-previous)
      (evil-leader/set-key "obt" 'bm-toggle)

      (add-hook 'after-init-hook #'bm-repository-load)
      (add-hook 'find-file-hooks #'bm-buffer-restore)
      (add-hook 'kill-buffer-hook #'bm-buffer-save)
      (add-hook 'kill-emacs-hook (lambda nil
                                   (bm-buffer-save-all)
                                   (bm-repository-save))))))
