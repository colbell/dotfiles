(setq dired-listing-switches "-alFh")
(setq dired-dwim-target t)
(load "dired-x")
;;(add-hook 'dired-mode-hook 'turn-on-auto-revert-mode)

;; Allow <ALT>o to omit hidden files
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))

(provide 'cnb-dired)
