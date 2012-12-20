(require 'recentf)

(setq recentf-save-file (file-truename (expand-file-name "recentf" user-emacs-directory)))
(setq recentf-max-saved-items 200)
(setq recentf-exclude '("~$"))

(add-to-list 'recentf-exclude recentf-save-file)

;; Because .emacs.d is a symlink to dotfiles/.emacs.d a file can have two names so
;; we need to ignore each file twice. The function (file-truename) will expand symlinks.
(setq exclude-files '("places" ".ido.last" "elpa/**/.*" "emacs.bmk" "url/cookies"))
(while exclude-files
  (setq f (car exclude-files))
  (setq f (expand-file-name f user-emacs-directory))
  (add-to-list 'recentf-exclude f)
  (add-to-list 'recentf-exclude (file-truename f))
  (setq exclude-files (cdr exclude-files)))

(recentf-mode 1)

(provide 'cnb-recentf)
