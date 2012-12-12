;;==============
;; Javascript
;;==============

;; From Emacs starter kit
(eval-after-load 'js
  '(progn (setq js-indent-level 2)
          ;; fixes problem with pretty function font-lock
          (define-key js-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js-mode `(("\\(function *\\)("
                       (0 (progn (compose-region (match-beginning 1)
                                                 (match-end 1) "\u0192")
                                 nil)))))))

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
  (set (make-local-variable 'tab-width) 2)
  (setq coffee-tab-width 2)
  (setq coffee-debug-mode t)
  (setq js-indent-level 2)
  (electric-indent-mode -1))

(provide 'cnb-js-coffee)
