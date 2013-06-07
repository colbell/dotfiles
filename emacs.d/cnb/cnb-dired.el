(setq dired-listing-switches "-alFh")
(setq dired-dwim-target t)
(load "dired-x")
;;(add-hook 'dired-mode-hook 'turn-on-auto-revert-mode)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'top)


;; Allow <ALT>o to omit hidden files
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))

(global-set-key (kbd "C-c C-d") 'dired-jump)

(provide 'cnb-dired)
