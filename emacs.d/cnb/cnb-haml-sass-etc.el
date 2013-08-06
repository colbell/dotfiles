(message (concat "Loading [" load-file-name "]"))

;; Colorise CSS color codes
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'sass-mode-hook 'rainbow-mode)

(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.hamlbars\\'" . haml-mode))
(autoload 'haml-mode "haml-mode" "Haml Mode." t)

(defun cnb-newline-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'haml-mode-hook (cnb-newline-indent))

(when (require 'sass-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
  (setq scss-compile-at-save nil))

(when (require 'flymake-haml nil t)
  (add-hook 'haml-mode-hook 'flymake-haml-load)
  (add-hook 'sass-mode-hook 'flymake-sass-load))

(when (require 'rhtml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
  (add-hook 'rhtml-mode-hook
            (lambda () (rinari-launch))))

(when (require 'handlebars-mode nil t)
)

;;(when (require 'slim-mode nil t)
;;  (add-to-list 'auto-mode-alist '("\\.emblem\\'" . slim-mode))) ;; Use Slim mode for emblem files - its close enuf.

(add-to-list 'auto-mode-alist '("\\.emblem\\'" . slim-mode))
(autoload 'slim-mode "slim-mode" "Slim Mode." t)

(provide 'cnb-haml-sass-etc)
