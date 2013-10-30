(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (ac-config-default)

  (define-key ac-mode-map (kbd "C-c i") 'auto-complete)

  (add-to-list 'ac-modes 'enh-ruby-mode)
  ;;(add-to-list 'ac-modes 'web-mode)

  (setq ac-auto-start nil))

(provide 'cnb-auto-complete)
