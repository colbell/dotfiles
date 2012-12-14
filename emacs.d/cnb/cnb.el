(setq personal-dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat personal-dotfiles-dir "/vendor") t)

(setq oddmuse-directory "~/.emacs.d/oddmuse")

(require 'cnb-defuns)          ;; utility functions
(add-subdirs-to-load-path (concat personal-dotfiles-dir "/vendor"))

(require 'cl)

(require 'cnb-elpa)            ;; Package manager stuff
(require 'cnb-bm)              ;; Bookmark config
(require 'cnb-ui)              ;; Basic UI setup
(require 'cnb-backups)         ;; File backups
(require 'cnb-coding-system)   ;; UTF-8 setup
(require 'cnb-recentf)         ;; View recently opened files
(require 'cnb-helm)            ;; Anything successor
(require 'cnb-ibuffer)         ;; IBuffer config
(require 'cnb-dired)           ;; Dired config
(require 'cnb-coding-hook)     ;; Setup for coding buffers
(require 'cnb-org)             ;; Org mode config
(require 'cnb-ruby)            ;; Ruby mode config
(require 'cnb-haml-sass-etc)   ;; HTML CSS modes
(require 'cnb-js-coffee)       ;; Coffeescript, JS
(require 'cnb-auto-complete)   ;; tab-completiom
(require 'cnb-kill-ring)       ;; Kill ring configuration
(require 'cnb-twitter)         ;; Read twitter stream
(require 'cnb-abbrev)          ;; Auto-correction
(require 'cnb-w3m)             ;; W3m config
(require 'cnb-comint)          ;; Comint mode config
(require 'cnb-saveplace)       ;; Saveplace
(provide 'cnb-uniquify)        ;; Unique buffer names
(require 'cnb-yasnippet)       ;; ya-snippet config
(require 'cnb-nonstd-cmds)     ;; Enable non-std commands
(require 'cnb-global-keys)     ;; Global key bindings
(require 'cnb-aliases)         ;; Aliases to common cmds
(require 'cnb-modeline)        ;; Modeline config

(server-start)
(setenv "EDITOR" "emacsclient")


;; Default to unified diffs
(setq diff-switches "-u -w")

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;;(setq browse-url-browser-function 'browse-url-firefox)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")


(global-auto-revert-mode t)

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;; Ignore symbolic link warning msgs.
(setq find-file-visit-truename t)

(when (require 'tramp nil t)
 (setq tramp-default-method "ssh"))


;;*==============================================
;; Remember mini-buffer history
;;*==============================================
(setq savehist-additional-variables
      '(search-ring regexp-search-ring kill-ring compile-history))
(savehist-mode t)


;;*==============================================
;; ido mode
;;*==============================================
;; (when (require 'ido-ubiquitous nil t)
;;   (ido-everywhere 1))
;; (setq ido-max-prospects 12)
;; (setq ido-ignore-buffers '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido"))
;; (setq ido-confirm-unique-completion t)
;; (setq ido-enable-prefix nil)
;; (setq ido-enable-flex-matching t)
;; (setq ido-create-new-buffer 'always)
;; (setq ido-use-filename-at-point 'guess)
;; (setq ido-use-virtual-buffers t)
;; (setq ido-auto-merge-inhibit-characters-regexp ".");; Don't try to find a file in another directory
;; (ido-mode t)


;; (defadvice ffap-file-at-point (after avoid-c-comments activate)
;;   "Don't return paths like \"/******\" unless they actually exist.

;; This fixes the bug where ido would try to suggest a C-style
;; comment as a filename."
;;   (ignore-errors
;;     (when (and ad-return-value
;;                (string-match-p ffap-c-commment-regexp
;;                                ad-return-value)
;;                (not (ffap-file-exists-string ad-return-value)))
;;       (setq ad-return-value nil))))


;;==============
;; Markdown mode
;;==============
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))


;;==============
;; Smex - ido for <alt>x
;;==============
;;(require 'smex)
;;(setq smex-save-file "~/.emacs.d/smex-items") ;; FIXME: doesn't work
;;(setq smex-save-file (concat dotfiles-dir  "smex-items")) ;; FIXME: doesn't work
;;(smex-initialize)


;;==============
;; rvm
;;==============
;; (when (require 'rvm nil t)
;;   (rvm-use-default)) ;; use rvm's default ruby as default


;;==============
;; crontab editing
;;==============
(add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode))


;;*==============================================
;; Spelling
;;*==============================================
(setq ispell-extra-args '("--sug-mode=ultra"))

(add-hook 'magit-log-edit-mode-hook 'flyspell-mode)
(add-hook 'git-commit-mode-hook 'flyspell-mode)


;;*==============================================
;; Grammer checking. diction-region or diction-buffer
;;*==============================================
;;(require 'diction)


;;*==============================================
;; Find file in project
;;*==============================================
(require 'find-file-in-project nil t)

;;*==============================================
;; C-c left  C-c right  undo/redo window config changes
;;*==============================================
;; (when (fboundp 'winner-mode)
;;   (winner-mode 1))


;;*==============================================
;; Better C-x o binding.
;;*==============================================
(require 'switch-window nil t)


;;*==============================================
;; Drag mode. Allows dragging by alt left up etc.
;;*==============================================
(when (require 'drag-stuff nil t)
  (drag-stuff-global-mode t))


;;*==============================================
;; Editing mutt mail
;;*==============================================
(require 'muttrc-mode)
(add-to-list 'auto-mode-alist '("/tmp/mutt" . mail-mode))


;;*==============================================
;; BBDB
;; *==============================================
;; (when (require 'bbdb nil t)
;;   (bbdb-initialize 'gnus 'message 'w3)
;;   (setq bbdb-complete-name-allow-cycling t)
;;   (setq bbdb-completion-display-record nil) ; Don't show completions in a new buffer
;;   (setq bbdb-accept-name-mismatch t) ; Be quiet if names mismatch
;;   (setq bbdb-always-add-addresses nil)
;;   (setq bbdb-north-american-phone-numbers-p nil)
;;   ;; FIXME: Move to gnus.el
;;   (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus))


;;*==============================================
;; Google contacts integration
;;*==============================================
;; (require 'xml)
;; (when (require 'oauth2 nil t)
;;   (require 'google-contacts nil t)
;;   (require 'google-contacts-message nil t))



;;*=======================
;;* SQL mode customisations.
;;*=======================
(setq sql-input-ring-file-name "~/.emacs.d/sql_history")


;;==============
;; Cheat mode
;;==============
;;(autoload 'cheat' "cheat" "" t)

;;==============
;; RI mode
;;==============
;;(autoload 'ri' "ri" "" t)

;;==============
;; Text mode
;;==============
;;(add-hook 'text-mode-hook 'goto-address)


;;==============
;; YAML mode
;;==============
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-hook 'yaml-mode-hook
            '(lambda () (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))))


;;==============
;; Cucumber Features mode
;;==============
(when (require 'feature-mode nil t)
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))


;;==============
;; hippie-expand
;;==============
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs
                                         try-expand-dabbrev try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill try-complete-lisp-symbol))


;;==============
;; auto-pair mode
;;==============
;; (when (require 'autopair nil t)
;;   (autopair-global-mode)
;;   (delete-selection-mode nil) ;; So that setting autopair-autowrap works
;;   (setq autopair-autowrap t)
;;   ;; Workarounds for incompatibilities.
;;   ;; (add-hook 'latex-mode-hook
;;   ;;           #'(lambda ()
;;   ;;               (set (make-local-variable 'autopair-handle-action-fns)
;;   ;;                    (list #'autopair-default-handle-action
;;   ;;                          #'autopair-latex-mode-paired-delimiter-action))))
;;   ;; ;; Slime incompatability
;;   ;; (add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))
;;   )
(electric-pair-mode t)
;;(electric-indent-mode t)
(electric-layout-mode t)


;;==============
;; ctags
;;==============
(autoload 'etags-select-find-tag-at-point "etags-select" "" t)
(autoload 'etags-select-find-tag "etags-select" "" t)


;;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))



;;==============
;; CUA mode, really only used for rectangular editing.
;;==============
(cua-mode t)
(setq cua-enable-cua-keys nil)
(setq cua-delete-selection nil)
(cua-selection-mode t)


;;==============
;; Purge unused buffers
;;==============
(require 'midnight)
(add-to-list 'clean-buffer-list-kill-never-buffer-names "*info*")


;;==============
;; Slime
;;==============
;; (setq inferior-lisp-program "clisp")
;; ;;(add-to-list 'load-path "~/.slime")
;; (when (require 'slime nil t)
;;   (slime-setup))


(provide 'cnb)
