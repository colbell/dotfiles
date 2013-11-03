(when (require 'smartparens-config nil t)
  (require 'smartparens-ruby)

  (smartparens-global-mode)

  (show-smartparens-global-mode +1)

  ;; (setq show-paren-style 'mixed)
  ;; (show-paren-mode 1)

  (sp-with-modes '(rhtml-mode)
    (sp-local-pair "<" ">")
    (sp-local-pair "<%" "%>")))

(provide 'cnb-smartparens)
