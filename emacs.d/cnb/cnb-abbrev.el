(message (concat "[CNB] - Loading [" load-file-name "]"))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs 'silently)

(if (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))

(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))

(provide 'cnb-abbrev)
