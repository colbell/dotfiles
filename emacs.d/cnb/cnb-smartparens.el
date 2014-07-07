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

  (setq sp-autoescape-string-quote nil) ; Irritating.

  (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
  (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

  (define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
  (define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
  (define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
  (define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

  (define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
  (define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
  (define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

  (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
  (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

  (define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp) ;; FIXME: Doesn't work
  (define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)
  )

(provide 'cnb-smartparens)
