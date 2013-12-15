(message (concat "[CNB] - Loading [" load-file-name "]"))

(require 'whitespace)

(setq whitespace-style '(face tabs trailing lines-tail space-before-tab indentation space-after-tab))
(set-default 'show-trailing-whitespace t)
(setq whitespace-line-column 80)
(global-whitespace-mode 1)

(defun cnb-ws-hook ()
  (setq show-trailing-whitespace nil))

(add-hook 'comint-mode-hook 'cnb-ws-hook)
(add-hook 'term-mode-hook 'cnb-ws-hook)
(add-hook 'package-menu-mode-hook 'cnb-ws-hook)
(add-hook 'helm-mode-hook 'cnb-ws-hook)
(add-hook 'completion-list-mode-hook 'cnb-ws-hook)
(add-hook 'buffer-menu-mode-hook 'cnb-ws-hook)
(add-hook 'fundamental-mode-hook 'cnb-ws-hook)
(add-hook 'mu4e-headers-mode-hook 'cnb-ws-hook)
(add-hook 'mu4e-view-mode-hook 'cnb-ws-hook)
(add-hook 'jabber-roster-mode-hook 'cnb-ws-hook)
(add-hook 'jabber-chat-mode 'cnb-ws-hook)
(add-hook 'ps-mode-hook 'cnb-ws-hook)
(add-hook 'rspec-compilation-mode-hook 'cnb-ws-hook)

(provide 'cnb-ws)
