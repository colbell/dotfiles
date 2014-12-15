(require 'cl)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; Taken from emacs starter kit
(setq personal-dotfiles-dir (concat dotfiles-dir "cnb"))

(autoload 'esup "esup" "Emacs Start Up Profiler." nil)

;; I use keys that start with C-o for personal mappings.
(global-unset-key "\C-o")

(setq load-prefer-newer t)


(require 'org)
(org-babel-load-file (concat personal-dotfiles-dir "/init.org"))


;;(require 'cnb-elpa)            ;; Package manager stuff
(require 'cnb-defuns)          ;; Utility functions

(require 'cnb-lisp)            ;; Lisp, Clojure etc.


(require 'cnb-nonstd-cmds)     ;; Enable non-std commands

(require 'cnb-print)           ;; Printing

(require 'cnb-edit-server)     ;; Edit within Chrome
;;(require 'cnb-sessions)        ;; Sessions
(require 'cnb-modeline)        ;; Modeline config

(require 'time)
(defun cnb/init-time()
  (message (concat "Startup Time: " (emacs-init-time))))

(add-hook 'after-init-hook 'cnb/init-time)
