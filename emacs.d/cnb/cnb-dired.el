(message (concat "[CNB] - Loading [" load-file-name "]"))

(setq dired-listing-switches "-alFh")
(setq dired-dwim-target t)

;;(load "dired-x")
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")))

(add-hook 'dired-mode-hook
          (lambda ()
            (visual-line-mode -1)))

;;(add-hook 'dired-mode-hook 'turn-on-auto-revert-mode)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(defun cnb-dired-back-to-top ()
  "Move to the first file name in the dired buffer"
  (interactive)
  (let (has-omit-mode has-hide-details-mode line-nbr)
    (when (and (boundp 'dired-omit-mode) dired-omit-mode)
      (setq has-omit-mode t))
    (when (and (boundp 'dired-hide-details-mode) dired-hide-details-mode)
      (setq has-hide-details-mode t))
    (cond
     ((and has-omit-mode has-hide-details-mode)
      (setq line-nbr 1))
     (has-omit-mode
      (setq line-nbr 3))
     (has-hide-details-mode
      (setq line-nbr 3))
     (t
      (setq line-nbr 3)))
    (message (number-to-string line-nbr))
    (beginning-of-buffer)
    (dired-next-line line-nbr)))

(defun old-cnb-dired-back-to-top ()
  "Move to the first file name in the dired buffer"
  (interactive)
  (let* (line-nbr)
    (if (and (boundp 'dired-hide-details-mode) dired-hide-details-mode)
        (setq line-nbr 3)
      (setq line-nbr 4))
    (if (and (boundp 'dired-omit-mode) dired-omit-mode)
        (setq line-nbr 2))
    (beginning-of-buffer)
    (dired-next-line line-nbr)))

(defun cnb-dired-jump-to-bottom ()
  "Jump to last file in dired buffer"
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(when (boundp 'dired-mode-map)
  ;; Change M-< instead of moving to the dired headings move to the first
  ;; file name.
  (define-key dired-mode-map
    (vector 'remap 'beginning-of-buffer) 'cnb-dired-back-to-top)
  (define-key dired-mode-map
    (vector 'remap 'end-of-buffer) 'cnb-dired-jump-to-bottom))

;; Change M-> instead of moving to empty line at bottom  move to the last
;; file name.

;; Allow <ALT>o to omit hidden files
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))


(setq wdired-allow-to-change-permissions 't)
(setq wdired-confirm-overwrite 't)

;;(global-set-key (kbd "C-c C-d") 'dired-jump)

(provide 'cnb-dired)
