;; C-u 0 M-x byte-recompile-directory
;; will speed up emacs start time.

;; - Cleanup flymake/flyspell
;; (defface flymake-message-face
;;  '((((class color) (background light)) (:foreground "#b2dfff"))
;;    (((class color) (background dark))  (:foreground "#b2dfff")))
;;  "Flymake message face")


(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; Taken from emacs starter kit

(setq personal-dotfiles-dir (concat dotfiles-dir "cnb"))
(add-to-list 'load-path personal-dotfiles-dir)

(setq custom-file (concat dotfiles-dir "emacs-custom.el"))
(load custom-file t)

;;(setq inhibit-startup-echo-area-message "colbell")
(eval '(setq inhibit-startup-echo-area-message "colbell"))

(require 'cnb-defuns) ;; Utility functions (incl add-subdirs-to-load-path)
(add-to-list 'load-path (concat personal-dotfiles-dir "/vendor"))
(add-subdirs-to-load-path (concat personal-dotfiles-dir "/vendor"))

(autoload 'esup "esup" "Emacs Start Up Profiler." nil)

(require 'cl)
(require 'cnb-elpa)            ;; Package manager stuff
(require 'cnb-ui)              ;; Basic UI setup
(require 'cnb-auto-complete)   ;; tab-completiom
(require 'cnb-fringe)          ;; Fringe setup
(require 'cnb-bookmarks)       ;; Bookmark config
(require 'cnb-backups)         ;; File backups
(require 'cnb-coding-system)   ;; UTF-8 setup
(require 'cnb-rvm)             ;; Ruby version manager
(require 'cnb-file-finding)    ;; Various ways to find files
(require 'cnb-icicles)         ;; Icicles mode
(require 'cnb-lisp)            ;; Lisp, Clojure etc.
(require 'cnb-ibuffer)         ;; IBuffer config
(require 'cnb-dired)           ;; Dired config
(require 'cnb-coding-hook)     ;; Setup for coding buffers
(require 'cnb-sc)              ;; Source Control config
(require 'cnb-org)             ;; Org mode config
(require 'cnb-cobol)           ;; COBOL mode config
(require 'cnb-projectile)      ;; Projectile Project management

(require 'cnb-robe)
;;(require 'cnb-enh-ruby)        ;; Ruby mode config
(require 'cnb-ruby)            ;; Ruby mode config
(require 'cnb-haml-sass-etc)   ;; HTML CSS modes

(require 'cnb-lisp)            ;; Lisp, Clojure/cider etc.
(require 'cnb-scala)           ;; Scala config
(require 'cnb-js-coffee)       ;; Coffeescript, JS
(require 'cnb-undo)            ;; Undo configuration
(require 'cnb-twitter)         ;; Read twitter stream
(require 'cnb-abbrev)          ;; Auto-correction
;; (require 'cnb-w3m)             ;; W3m config
(require 'cnb-ws)              ;; Whitespace config
(require 'cnb-uniquify)        ;; Unique buffer names
(require 'cnb-yasnippet)       ;; ya-snippet config
(require 'cnb-nonstd-cmds)     ;; Enable non-std commands
(require 'cnb-aliases)         ;; Aliases to common cmds
(require 'cnb-general)         ;; General stuff
(require 'cnb-midnight)        ;; Cleanup unused buffers
(require 'cnb-modeline)        ;; Modeline config
(require 'cnb-term)            ;; Terminal mode
(require 'cnb-global-keys)     ;; Global key bindings
(require 'cnb-jabber)          ;; Gtalk
(require 'cnb-win)             ;; Window handling
(require 'cnb-print)           ;; Printing
(require 'cnb-scrolling)       ;; Scrolling
(require 'cnb-ace)             ;; Ace jump

;; Causes the following in Emacs 24.4.50.2
;; Error in post-command-hook (global-hl-line-highlight): (wrong-type-argument overlayp nil)
;;(require 'cnb-crosshairs)      ;; Screen crosshairs

(require 'cnb-edit-server)     ;; Edit within Chrome
(require 'cnb-smartparens)     ;; Smart parens
;;(require 'cnb-mu4e)            ;; Email
(require 'cnb-sessions)        ;; Sessions

(require 'time)
(defun cnb-init-time()
  (message (concat "Startup Time: " (emacs-init-time))))

(add-hook 'after-init-hook 'cnb-init-time)
