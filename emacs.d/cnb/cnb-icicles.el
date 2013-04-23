(when (require 'icicles nil t)
  (icy-mode)
  (global-set-key [f11] 'icicle-recent-file))

(provide 'cnb-icicles)
