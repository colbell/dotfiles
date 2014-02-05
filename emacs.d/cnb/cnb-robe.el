(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'robe-mode nil t)
  (add-hook 'robe-mode-hook 'robe-ac-setup))

(provide 'cnb-robe)
