;;; package --- My Emacs configuration

;;; Commentary:

;; My Emacs configuaration is stored in colbell.org and is
;; compiled into colbell.el via org-babel-load-file.

;;; Code:

;; Use org-babel-load-file to compile colbell.org into colbell.el and
;; then load colbell.el. Only do this if colbell.el doesn't exist or
;; if colbell.org is newer than colbell.el.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(let ((my-el-f (expand-file-name "colbell.el" user-emacs-directory))
      (my-org-f (expand-file-name "colbell.org" user-emacs-directory)))
  (if (or (not (file-exists-p my-el-f))
          (time-less-p (nth 5 (file-attributes my-el-f))
                       (nth 5 (file-attributes my-org-f))))
      (org-babel-load-file my-org-f)
    (load my-el-f)))

(provide 'init)
;;; init.el ends here
