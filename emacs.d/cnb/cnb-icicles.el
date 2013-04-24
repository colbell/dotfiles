(when (require 'icicles nil t)
  (icy-mode)
  (global-set-key (kbd "C-x C-r") 'icicle-recent-file))

(provide 'cnb-icicles)
