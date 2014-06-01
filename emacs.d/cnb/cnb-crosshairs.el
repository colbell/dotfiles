(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'crosshairs nil t)
  ;; (toggle-crosshairs-when-idle 1)
  ;; (hl-line-when-idle-interval 15)

  ;; (defadvice switch-to-buffer (after switch-to-buffer-flash-crosshairs activate)
  ;;   "Call flash-crosshairs after switch-to-buffer"
  ;;   (flash-crosshairs))

  ;; (defadvice icicle-other-window-or-frame (after icicle-other-window-or-frame-flash-crosshairs activate)
  ;;   "Call flash-crosshairs after icicle-other-window-or-frame"
  ;;   (flash-crosshairs))

  ;; (defadvice windmove-do-window-select (after windmove-do-flash-crosshairs activate)
  ;;   "Call flash-crosshairs after windmove-do-window-select"
  ;;   (flash-crosshairs))

  (global-set-key (kbd "<f11>") 'flash-crosshairs))

(provide 'cnb-crosshairs)
