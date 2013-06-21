(when (require 'yasnippet nil t)
  (yas-global-mode 1)
  ;;(require 'helm-c-yasnippet nil t)
  (setq yas-prompt-functions '(yas-ido-prompt
                               yas-completing-prompt)))

(when (fboundp 'yas-insert-snippet)
  (global-set-key (kbd "C-c y") 'yas-insert-snippet))

(provide 'cnb-yasnippet)
