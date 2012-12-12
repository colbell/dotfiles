(defun cnb-term-mode-hook ()
  (setq show-trailing-whitespace nil))

(add-hook 'term-mode-hook 'cnb-term-mode-hook)

(provide 'cnb-term)
