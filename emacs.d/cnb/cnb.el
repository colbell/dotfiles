(setq personal-dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat personal-dotfiles-dir "/vendor") t)

(setq oddmuse-directory (expand-file-name "oddmuse" user-emacs-directory))

(require 'cnb-defuns)          ;; utility functions

(add-subdirs-to-load-path (concat personal-dotfiles-dir "/vendor"))

(autoload 'esup "esup" "Emacs Start Up Profiler." nil)

(require 'cl)

(require 'cnb-elpa)            ;; Package manager stuff
(require 'cnb-ui)              ;; Basic UI setup
(require 'cnb-bm)              ;; Bookmark config
(require 'cnb-backups)         ;; File backups
(require 'cnb-coding-system)   ;; UTF-8 setup
(require 'cnb-rvm)             ;; Ruby version manager

(require 'cnb-file-finding)    ;; Various ways to find files
(require 'cnb-icicles)         ;; Icicles mode
;;(require 'cnb-helm)            ;; Anything successor
;;(require 'cnb-ido)             ;; IDO mode

(require 'cnb-ibuffer)         ;; IBuffer config
(require 'cnb-dired)           ;; Dired config
(require 'cnb-coding-hook)     ;; Setup for coding buffers
(require 'cnb-sc)              ;; Source Control config
(require 'cnb-org)             ;; Org mode config
(require 'cnb-ruby)            ;; Ruby mode config
(require 'cnb-haml-sass-etc)   ;; HTML CSS modes
(require 'cnb-js-coffee)       ;; Coffeescript, JS
(require 'cnb-auto-complete)   ;; tab-completiom
(require 'cnb-kill-ring)       ;; Kill ring configuration
(require 'cnb-twitter)         ;; Read twitter stream
(require 'cnb-abbrev)          ;; Auto-correction
(require 'cnb-w3m)             ;; W3m config
(require 'cnb-ws)              ;; Whitespace config
(require 'cnb-saveplace)       ;; Saveplace
(require 'cnb-uniquify)        ;; Unique buffer names
(require 'cnb-yasnippet)       ;; ya-snippet config
(require 'cnb-nonstd-cmds)     ;; Enable non-std commands
(require 'cnb-aliases)         ;; Aliases to common cmds
(require 'cnb-general)         ;; General stuff
(require 'cnb-modeline)        ;; Modeline config
(require 'cnb-term)            ;; Terminal mode
(require 'cnb-global-keys)     ;; Global key bindings
(require 'cnb-auto-dim)        ;; Change bg color on inactive buffers
(require 'cnb-mu4e)            ;; Email
(require 'cnb-jabber)          ;; Gtalk
(require 'cnb-win)             ;; Window handling
(require 'cnb-print)           ;; Printing
(require 'cnb-ace)             ;; Ace jump and buffer setup

(provide 'cnb)
