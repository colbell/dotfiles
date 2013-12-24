(message (concat "[CNB] - Loading [" load-file-name "]"))

;; Ignore symbolic link warning msgs.
(setq find-file-visit-truename t)

;; (when (require 'tramp nil t)
;;  (setq tramp-default-method "ssh"))

(when (require 'find-file-in-repository nil t)
  (global-set-key (kbd "C-x f") 'find-file-in-repository))

(require 'recentf)

(setq recentf-save-file (file-truename (expand-file-name "recentf"
                                                         user-emacs-directory)))
(setq recentf-max-saved-items 1000)
(setq recentf-exclude '("~$" "/tmp/" "/ssh:" "/sudo:"))

(add-to-list 'recentf-exclude recentf-save-file)

;; Because .emacs.d is a symlink to dotfiles/.emacs.d a file can have two names
;; so we need to ignore each file twice. The function (file-truename) will
;; expand symlinks.
(setq exclude-files '("places" ".ido.last" "elpa/**/.*" "emacs.bmk"
                      "url/cookies" "/home/colbell/.jabber-avatars/*"))
(while exclude-files
  (setq f (expand-file-name (car exclude-files) user-emacs-directory))
  (add-to-list 'recentf-exclude f)
  (add-to-list 'recentf-exclude (file-truename f))
  (setq exclude-files (cdr exclude-files)))

(recentf-mode 1)

(provide 'cnb-file-finding)
