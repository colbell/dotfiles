(message (concat "[CNB] - Loading [" load-file-name "]"))

(require 'server)
(unless (server-running-p)
  (server-start))

(setenv "EDITOR" "emacsclient")

;; Default to unified diffs
(setq diff-switches "-u -w")

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;;(setq browse-url-browser-function 'browse-url-firefox)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")

(setq compilation-scroll-output t)
(global-auto-revert-mode t)
(setq auto-revert-verbose nil)
(setq global-auto-revert-non-file-buffers t)

(setq line-move-visual nil)
;;(global-visual-line-mode 1)

;;(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

;; Show flymake errors in mini-buffer
(require 'flymake-cursor nil t)

(setq delete-by-moving-to-trash t)

;; Associate fish files with shell-script mode
(add-to-list 'auto-mode-alist '("\\.fish$" . shell-script-mode))

(setq doc-view-resolution 192)  ;; makes PDFs look better
(setq doc-view-continuous t)


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


;; (when (require 'discover nil t)
;;   (global-discover-mode 1))

;;==============
;; Markdown mode
;;==============
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)

(add-hook 'markdown-mode 'flyspell-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))


;;==============
;; crontab editing
;;==============
(add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode))


;;*==============================================
;; Spelling
;;*==============================================
(setq ispell-extra-args '("--sug-mode=ultra"))


;;*==============================================
;; Grammer checking. diction-region or diction-buffer
;;*==============================================
;;(require 'diction)

;;*==============================================
;; C-c left  C-c right  undo/redo window config changes
;;*==============================================
;; (when (fboundp 'winner-mode)
;;   (winner-mode 1))


;;*==============================================
;; Drag mode. Allows dragging by alt left up etc.
;;*==============================================
(when (require 'drag-stuff nil t)
  (drag-stuff-global-mode t))


;;*==============================================
;; Editing mutt mail
;;*==============================================
(add-to-list 'auto-mode-alist '("/tmp/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("muttrc" . muttrc-mode))
(autoload 'muttrc-mode "muttrc-mode" t nil)


;;*==============================================
;; BBDB
;;*==============================================
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
  (add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
  (add-hook 'yaml-mode-hook
            (lambda ()
              (define-key yaml-mode-map (kbd "RET") 'newline-and-indent)
              (electric-indent-local-mode -1))))


;;==============
;; Cucumber Features mode
;;==============
(when (require 'feature-mode nil t)
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))



;;==============
;; multiple cursors
;;==============
(when (require 'multiple-cursors nil t)
  (global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))



;;(electric-pair-mode t)
(electric-layout-mode)


;; (when (require 'smartscan nil t)
;;   (global-smartscan-mode 1))

(when (require 'hungry-delete nil t)
  (global-hungry-delete-mode))

;;==============
;; ctags
;;==============
;; (autoload 'etags-select-find-tag-at-point "etags-select" "" t)
;; (autoload 'etags-select-find-tag "etags-select" "" t)


;;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Seed the random number generator
(random t)

;;==============
;; CUA mode, really only used for rectangular editing.
;;==============
;; (cua-mode t)
;; (setq cua-enable-cua-keys nil)
;; (setq cua-delete-selection nil)
;; (cua-selection-mode t)


;; (when (require 'butler nil t)
;;   (setq butler-servers '())  ;; Bug in butler
;;   (if (system-is-tickit)
;;       (setq butler-servers
;;             '((jenkins "tickit"
;;                        (server-address . "http://192.168.1.113:8080")
;;                        (server-user . "user")
;;                        (server-passord . "user"))))))


;; ;Better registers
(when (require 'better-registers nil t)
  (setq better-registers-save-file (concat dotfiles-dir "emacsregisters.el"))
  (better-registers-install-save-registers-hook))

(provide 'cnb-general)
