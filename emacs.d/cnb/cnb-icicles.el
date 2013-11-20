(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'icicles nil t)
  (icy-mode 1)
  (global-set-key (kbd "C-x C-r") 'icicle-recent-file))

(provide 'cnb-icicles)
