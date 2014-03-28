(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'smartparens-config nil t)
  (require 'smartparens-ruby)
  (require 'smartparens-html)
  (require 'smartparens-latex)

  (smartparens-global-mode)

  (show-smartparens-global-mode t)

  (sp-with-modes '(rhtml-mode)
    (sp-local-pair "<" ">")
    (sp-local-pair "<%" "%>")))

(provide 'cnb-smartparens)
