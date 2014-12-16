(require 'cl)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; Taken from emacs starter kit
(setq personal-dotfiles-dir (concat dotfiles-dir "cnb"))

(autoload 'esup "esup" "Emacs Start Up Profiler." nil)

;; I use keys that start with C-o for personal mappings.
(global-unset-key "\C-o")

(setq load-prefer-newer t)

(org-babel-load-file (concat personal-dotfiles-dir "/init.org"))

(require 'cnb-lisp)
