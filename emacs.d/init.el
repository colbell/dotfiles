;;(require 'cl)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; Taken from emacs starter kit
(setq personal-dotfiles-dir (concat dotfiles-dir "cnb"))

;; I use keys that start with C-o for personal mappings.
(global-unset-key "\C-o")

(setq my-el-f (concat personal-dotfiles-dir "/init.el"))
(setq my-org-f (concat personal-dotfiles-dir "/init.org"))

;; Use org-babel-load-file to compile colbell.org into colbell.el and
;; then load colbell.el. Only do this if colbell.el doesn't exist or
;; if colbell.org is newer than colbell.el.
(if (or (not (file-exists-p my-el-f))
        (time-less-p (nth 5 (file-attributes my-el-f))
                     (nth 5 (file-attributes my-org-f))))
    (org-babel-load-file my-org-f)
  (load my-el-f))
