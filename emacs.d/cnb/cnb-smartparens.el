(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'smartparens-config nil t)
  (require 'smartparens-ruby)
  (require 'smartparens-html)
  (require 'smartparens-latex)

  (smartparens-global-mode t)

  (show-smartparens-global-mode t)

  (sp-with-modes '(rhtml-mode)
    (sp-local-pair "<" ">")
    (sp-local-pair "<%" "%>"))

  (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
  (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

  (define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
  (define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
  (define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
  (define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)
  )

(provide 'cnb-smartparens)
