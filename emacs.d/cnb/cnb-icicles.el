(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'icicles nil t)
  (icy-mode 1)

  ;; Change to  M-t M-t as the default M-s M-s interferes with discover mode.
  (setq icicle-search-key-prefix "\364\364")
  (global-set-key (kbd "C-x C-r") 'icicle-recent-file))

(provide 'cnb-icicles)
