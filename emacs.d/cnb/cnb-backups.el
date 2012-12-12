(setq version-control t)
(setq backup_by_copying t)
(setq backup-by-copying-when-linked t)
(setq backup-by-copying-when-mismatch t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq delete-old-versions t)
(setq backup-directory-alist
      `(("." . ,(expand-file-name "~/.emacs.d/backups"))))

(provide 'cnb-backups)
