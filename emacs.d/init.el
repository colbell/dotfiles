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

;; Load settings set by the "Customize" interface.
;; (setq custom-file (concat dotfiles-dir "emacs-custom.el"))
;; (load custom-file t)


;;(require 'cnb-elpa)            ;; Package manager stuff
(require 'cnb-defuns)          ;; Utility functions
(require 'cnb-ui)              ;; Basic UI setup

;;FIXME:
(require 'cnb-keychord)        ;; Keychord setup

(require 'cnb-rvm)             ;; Ruby version manager
(require 'cnb-lisp)            ;; Lisp, Clojure etc.

;;FIXME:
(require 'cnb-coding-hook)     ;; Setup for coding buffers

;;FIXME:
(require 'cnb-ruby)            ;; Ruby mode config

(require 'cnb-nonstd-cmds)     ;; Enable non-std commands
(require 'cnb-term)            ;; Terminal mode
(require 'cnb-print)           ;; Printing

(require 'cnb-edit-server)     ;; Edit within Chrome
;;(require 'cnb-sessions)        ;; Sessions
(require 'cnb-modeline)        ;; Modeline config
(require 'cnb-org)             ;; Org mode config
(require 'cnb-global-keys)     ;; Global key bindings

(require 'time)
(defun cnb/init-time()
  (message (concat "Startup Time: " (emacs-init-time))))

(add-hook 'after-init-hook 'cnb/init-time)
