(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; CSS

(setq css-indent-offset 2)
(add-hook 'css-mode-hook 'rainbow-mode)


;;;; SASS

(when (require 'sass-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
  (add-hook 'sass-mode-hook 'rainbow-mode)
  (setq scss-compile-at-save nil))


(when (require 'flymake-sass nil t)
  (add-hook 'sass-mode-hook 'flymake-sass-load))

(provide 'cnb-css)
