(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'ace-jump-mode nil t)
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode))

;; Bind 'o' to links in Help and Info buffers
(when (fboundp 'ace-link-setup-default)
  (ace-link-setup-default))

(when (fboundp 'ace-jump-zap-to-char)
  (global-set-key (kbd "M-z") 'ace-jump-zap-to-char))

(provide 'cnb-ace)
