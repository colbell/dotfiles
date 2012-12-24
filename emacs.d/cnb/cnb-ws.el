(require 'whitespace)

(setq whitespace-style '(face tabs trailing lines space-before-tab indentation space-after-tab))
(set-default 'show-trailing-whitespace t)
(setq whitespace-line-column 999)
(global-whitespace-mode 1)

(defun cnb-ws-hook ()
  (setq show-trailing-whitespace nil))

(add-hook 'comint-mode-hook 'cnb-ws-hook)
(add-hook 'term-mode-hook 'cnb-ws-hook)
(add-hook 'package-menu-mode 'cnb-ws-hook)

(provide 'cnb-ws)
