(message (concat "[CNB] - Loading [" load-file-name "]"))

(setq dired-listing-switches "-alFh")
(setq dired-dwim-target t)
(load "dired-x")
;;(add-hook 'dired-mode-hook 'turn-on-auto-revert-mode)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; From http://whattheemacsd.com/
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;; Allow <ALT>o to omit hidden files
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))


(setq wdired-allow-to-change-permissions 't)
(setq wdired-confirm-overwrite 't)

;;(global-set-key (kbd "C-c C-d") 'dired-jump)

(provide 'cnb-dired)
