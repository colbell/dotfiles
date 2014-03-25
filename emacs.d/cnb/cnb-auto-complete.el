(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; auto-complete

(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (ac-config-default)

  (define-key ac-mode-map (kbd "C-c i") 'auto-complete)

  ;;(add-to-list 'ac-modes 'enh-ruby-mode)
  (add-to-list 'ac-modes 'haml-mode)
  ;;(add-to-list 'ac-modes 'web-mode)

  (setq ac-auto-start nil))


;;;; hippie-expand

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name try-expand-all-abbrevs
        try-expand-dabbrev try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill try-complete-lisp-symbol))

(provide 'cnb-auto-complete)
