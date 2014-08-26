(message (concat "[CNB] - Loading [" load-file-name "]"))

;;==============
;; JavaScript
;;==============

;; From Emacs starter kit
(eval-after-load 'js
  '(progn (setq js-indent-level 2)
          (define-key js-mode-map (kbd ",") 'self-insert-command)
          ;; fixes problem with pretty function font-lock
          ;; (font-lock-add-keywords
          ;;  'js-mode `(("\\(function *\\)("
          ;;              (0 (progn (compose-region (match-beginning 1)
          ;;                                        (match-end 1) "\u0192")
          ;;                        nil)))))
          (add-hook 'js-mode-hook
                    (lambda ()
                      (push '("function" . "\u0192") prettify-symbols-alist)))
          ))

;;==============
;; Coffee script
;;==============
(when (require 'coffee-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))

  (add-hook 'coffee-mode-hook
            '(lambda() (coffee-custom)))
  (when (require 'flymake-coffee nil t)
    (add-hook 'coffee-mode-hook (flymake-coffee-load))))

(defun coffee-custom ()
  "coffee-mode-hook"
  (make-local-variable 'tab-width)
  (set 'tab-width 2)
  (setq coffee-tab-width 2)
  (setq coffee-debug-mode t)
  (setq js-indent-level 2))

(provide 'cnb-js-coffee)
