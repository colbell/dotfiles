(message (concat "[CNB] - Loading [" load-file-name "]"))

(setq truncate-partial-width-windows nil)


;;*==============================================
;; Select window by direction
;;*==============================================
(when (require 'window-jump)
  (global-set-key (kbd "C-S-<up>") 'window-jump-up)
  (global-set-key (kbd "C-S-<down>") 'window-jump-down)
  (global-set-key (kbd "C-S-<left>") 'window-jump-left)
  (global-set-key (kbd "C-S-<right>") 'window-jump-right))

;;*==============================================
;; Select window by number
;;*==============================================
(when (require 'ace-window nil t)
  (global-set-key (kbd "C-x o") 'ace-window))

(provide 'cnb-win)
