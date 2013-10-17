(when (require 'crosshairs nil t)
  (toggle-crosshairs-when-idle 1)

  ;; Without this crosshairs turns global hiline mode on.
  (setq global-hl-line-mode nil)

  ;; FIXME: Use ad-add-advice to apply to a list of functions?
  (defadvice switch-to-buffer (after switch-to-buffer-flash-crosshairs activate)
    "Call flash-crosshairs after switch-to-buffer"
    (flash-crosshairs))
  (defadvice icicle-other-window-or-frame (after icicle-other-window-or-frame-flash-crosshairs activate)
    "Call flash-crosshairs after icicle-other-window-or-frame"
    (flash-crosshairs))
  (defadvice windmove-do-window-select (after windmove-do-flash-crosshairs activate)
    "Call flash-crosshairs after windmove-do-window-select"
    (flash-crosshairs)))

(provide 'cnb-crosshairs)
