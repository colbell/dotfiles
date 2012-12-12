(line-number-mode t)
(column-number-mode t)
(size-indication-mode)

;;*==============================================
;; Show current function name in modeline
;;*==============================================
(when (require 'which-func)
  (which-func-mode 1)
  (add-to-list 'which-func-modes 'ruby-mode))
  ;; (set-face-foreground 'which-func "gainsboro")
  ;; (set-face-background 'which-func "blue"))

(eval-after-load 'which-func
  '(progn
     (set-face-attribute 'which-func nil :weight 'bold)
     (set-face-foreground 'which-func "#f0dfaf")))

;; whichfunc is hard to read with default header colors.
(set-face-background 'header-line "grey90")
(set-face-foreground 'header-line "blue")


(when (require 'powerline nil t)
  (powerline-default))

(require 'battery)
(when (and battery-status-function
           (not (string-match-p "N/A"
                                (battery-format "%B"
                                                (funcall battery-status-function)))))
  (setq battery-mode-line-format "[%b%p%%%% %t]")
  (display-battery-mode 1))



(provide 'cnb-modeline)
