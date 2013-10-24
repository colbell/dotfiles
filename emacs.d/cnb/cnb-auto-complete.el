(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  ;;(setq ac-auto-start nil)
  (ac-config-default)
  (define-key ac-mode-map (kbd "C-c i") 'auto-complete))

;;  (defun ac-ruby-mode-setup ()
;;    (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags) ac-sources)))
;;;;    (when (require 'auto-complete-etags nil t)
;;;;      (setq ac-sources (append '(ac-source-etags) ac-sources)))
;;  (ac-config-default))

(provide 'cnb-auto-complete)
