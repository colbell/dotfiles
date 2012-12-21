(when (require 'yasnippet nil t)
  (yas-global-mode 1)
  (require 'helm-c-yasnippet nil t)
  (setq yas-prompt-functions '(yas-ido-prompt
                               yas-completing-prompt)))

(provide 'cnb-yasnippet)
