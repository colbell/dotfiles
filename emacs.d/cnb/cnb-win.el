(message (concat "[CNB] - Loading [" load-file-name "]"))

(setq truncate-partial-width-windows nil)


;;*==============================================
;; Select window by direction
;;*==============================================
(when (require 'window-jump)
  (global-set-key (kbd "C-c <up>") 'window-jump-up)
  (global-set-key (kbd "C-c <down>") 'window-jump-down)
  (global-set-key (kbd "C-c <left>") 'window-jump-left)
  (global-set-key (kbd "C-c <right>") 'window-jump-right))

;;*==============================================
;; Select window by number
;;*==============================================
(when (require 'ace-window nil t)
  (global-set-key (kbd "C-x o") 'ace-window))

(provide 'cnb-win)
