(when (require 'smartparens-config nil t)
  (require 'smartparens-ruby)

  (smartparens-global-mode)

  (show-smartparens-global-mode t)

  (sp-with-modes '(rhtml-mode)
    (sp-local-pair "<" ">")
    (sp-local-pair "<%" "%>")))

(provide 'cnb-smartparens)
