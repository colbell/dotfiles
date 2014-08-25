(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'sr-speedbar nil t)
  (setq sr-speedbar-auto-refresh t)
  (setq sr-speedbar-right-side nil)
  (setq sr-speedbar-skip-other-window-p t)

  (setq speedbar-show-unknown-files t)
  (setq speedbar-verbosity-level 2)
  (global-set-key (kbd "C-o s") 'sr-speedbar-toggle))

(provide 'cnb-speedbar)
