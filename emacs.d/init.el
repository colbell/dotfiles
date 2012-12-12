;; C-u 0 M-x byte-recompile-directory
;; will speed up emacs start time.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; Taken from emacs starter kit

(add-to-list 'load-path (concat dotfiles-dir "cnb"))

(setq custom-file (concat dotfiles-dir "emacs-custom.el"))
(load custom-file t)

(require 'cnb) ;; main config file
