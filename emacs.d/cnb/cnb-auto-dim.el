(when (require 'auto-dim-other-buffers nil t)
  (let (bg)
    (if (window-system)
        (setq bg "#073642")
      (setq bg "#262626"))
    (set-face-background 'auto-dim-other-buffers-face bg))

  (turn-on-auto-dim-other-buffers))

(provide 'cnb-auto-dim)
