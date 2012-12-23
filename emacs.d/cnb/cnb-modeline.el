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

;; (eval-after-load 'which-func
;;   '(progn
;;      (set-face-attribute 'which-func nil :weight 'bold)
;;      (set-face-foreground 'which-func "#f0dfaf")))



;; (when (require 'powerline nil t)
;;   (powerline-default))

(require 'battery)
(when (and battery-status-function
           (not (string-match-p "N/A"
                                (battery-format "%B"
                                                (funcall battery-status-function)))))
  (setq battery-mode-line-format "[%b%p%%%% %t]")
  (display-battery-mode 1))

;; Dimnish clutter
(when (require 'diminish nil t)
  (diminish 'undo-tree-mode)
  (diminish 'drag-stuff-mode)
  (diminish 'ruby-block-mode)
  (diminish 'whitespace-mode)
  (diminish 'global-whitespace-mode)
  (diminish 'volatile-highlights-mode))


(provide 'cnb-modeline)
