(message (concat "[CNB] - Loading [" load-file-name "]"))

(setq truncate-partial-width-windows nil)
;;(global-set-key (kbd "C-c r") 'rotate-windows)


;;*==============================================
;; shift + arrow keys to move between windows
;;*==============================================
;; (require 'windmove)
;; (windmove-default-keybindings)


;;*==============================================
;; Better window switching
;;*==============================================
(when (require 'ace-window nil t)
  (global-set-key (kbd "C-x o") 'ace-window))
;; (when (require 'switch-window nil t)
;;   (global-set-key (kbd "C-x o") 'switch-window))

(provide 'cnb-win)
