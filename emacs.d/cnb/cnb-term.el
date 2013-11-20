(message (concat "[CNB] - Loading [" load-file-name "]"))

(add-hook 'term-mode-hook
          (function
           (lambda ()
             (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
             (make-local-variable 'mouse-yank-at-point)
             (make-local-variable 'transient-mark-mode)
             (setq mouse-yank-at-point t)
             (setq transient-mark-mode nil)
             (auto-fill-mode -1)
             (setq tab-width 8 ))))

;; Use Emacs terminfo, not system terminfo
;;(setq system-uses-terminfo t)


;; find-grep and some  others don't work well with fish.
;; (setq shell-file-name "/bin/bash")
;; (setq explicit-shell-file-name "/bin/bash")

(provide 'cnb-term)
