(setq truncate-partial-width-windows nil)
(global-set-key (kbd "C-c r") 'rotate-windows)


;;*==============================================
;; shift + arrow keys to move between windows
;;*==============================================
(require 'windmove)
(windmove-default-keybindings)


;;*==============================================
;; Better C-x o binding.
;;*==============================================
(require 'switch-window nil t)
(global-set-key (kbd "C-'") 'other-window)  ;; Old C-x o


(provide 'cnb-win)
