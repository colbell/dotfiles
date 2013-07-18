(when (require 'auto-dim-other-buffers nil t)
  (set-face-background 'auto-dim-other-buffers-face "lightgray")
  (turn-on-auto-dim-other-buffers))

(provide 'cnb-auto-dim)
