;; I use keys that start with C-o for personal mappings.
(global-unset-key "\C-o")

;; Use org-babel-load-file to compile colbell.org into colbell.el and
;; then load colbell.el. Only do this if colbell.el doesn't exist or
;; if colbell.org is newer than colbell.el.
(let ((my-el-f (expand-file-name "colbell.el" user-emacs-directory))
      (my-org-f (expand-file-name "colbell.org" user-emacs-directory)))
  (if (or (not (file-exists-p my-el-f))
          (time-less-p (nth 5 (file-attributes my-el-f))
                       (nth 5 (file-attributes my-org-f))))
      (org-babel-load-file my-org-f)
    (load my-el-f)))
