(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; GENERAL

;; Colorise CSS color codes
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'sass-mode-hook 'rainbow-mode)


;;;; HAML

(defun cnb/haml-setup()
  (ignore-errors (robe-mode))
  (local-set-key (kbd "RET") 'newline-and-indent))
;;(add-hook 'haml-mode-hook (cnb/haml-setup))

(when (require 'haml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
  (add-to-list 'auto-mode-alist '("\\.hamlbars\\'" . haml-mode))
  (add-hook 'haml-mode-hook
            (lambda ()
            (electric-indent-local-mode -1)
            (rvm-activate-corresponding-ruby)))
  (when (require 'flymake-haml nil t)
    (add-hook 'haml-mode-hook 'flymake-haml-load)))


;;;; SASS

(when (require 'sass-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
  (setq scss-compile-at-save nil))


(when (require 'flymake-sass nil t)
  (add-hook 'sass-mode-hook 'flymake-sass-load))


;;;; RHTML

(when (require 'rhtml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
  (add-hook 'rhtml-mode-hook
            (lambda () (rinari-launch))))


;;;; HANDLEBARS

(when (require 'handlebars-mode nil t)
  )

;;(when (require 'slim-mode nil t)
;;  (add-to-list 'auto-mode-alist '("\\.emblem\\'" . slim-mode))) ;; Use Slim mode for emblem files - its close enuf.

;; (add-to-list 'auto-mode-alist '("\\.emblem\\'" . slim-mode))
;; (autoload 'slim-mode "slim-mode" "Slim Mode." t)


;;;; WEB-MODE

(when (require 'web-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(provide 'cnb-haml-sass-etc)
