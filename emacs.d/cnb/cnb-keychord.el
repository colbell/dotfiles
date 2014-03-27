(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'key-chord nil t)
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.2)

  (key-chord-define-global "qr"   'query-replace-regexp))

(provide 'cnb-keychord)
