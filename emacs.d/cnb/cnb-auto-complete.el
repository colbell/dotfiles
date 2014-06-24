(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; auto-complete

;; (when (require 'auto-complete-config nil t)
;;   (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;   (ac-config-default)

;;   (define-key ac-mode-map (kbd "C-c i") 'auto-complete)

;;   ;;(add-to-list 'ac-modes 'enh-ruby-mode)
;;   (add-to-list 'ac-modes 'haml-mode)
;;   ;;(add-to-list 'ac-modes 'web-mode)

;;   (setq ac-auto-start nil))

(when (require 'company nil t)

  ;; Only auto show popup if last command was an editing one. I.E don't do
  ;; after cursor keys. Only need this is using auto-popup.
  ;;(setq company-begin-commands '(self-insert-command))

  (push 'company-robe company-backends)
  (push 'company-cider company-backends)

  (global-company-mode 1)

  ;; Auto popup is irritating.
  (setq company-idle-delay nil)
  (global-set-key (kbd "C-c i") 'company-complete))

;;;; hippie-expand

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name try-expand-all-abbrevs
        try-expand-dabbrev try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill try-complete-lisp-symbol))

(global-set-key (kbd "M-/") 'hippie-expand)

(provide 'cnb-auto-complete)
