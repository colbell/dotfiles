(when (require 'projectile nil t)

  ;;(require 'grizzl)
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  ;;(setq projectile-completion-system 'grizzl)
  ;; Press Command-p for fuzzy find in project
  ;; Press Command-b for fuzzy switch buffer
    )

(provide 'cnb-projectile)
