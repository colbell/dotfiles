(ignore-errors
  (set-frame-font "Ubuntu Mono-11" nil t)
  ;;(load-theme 'solarized-dark t)
  (load-theme 'wombat t))

;;(menu-bar-mode -1)
(tool-bar-mode -1)

;;(setq redisplay-dont-pause nil) ;; Possibly stop emacs-snapshot from locking up.
(setq redisplay-dont-pause t)

(setq sentence-end-double-space nil)
(setq apropos-do-all t)
(auto-image-file-mode)

(set-default 'indent-tabs-mode nil)

(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(setenv "PAGER" "cat")

(setq show-paren-style 'mixed)
(show-paren-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1)

(setq confirm-kill-emacs 'y-or-n-p)

(setq completion-cycle-threshold 5)

(when (require 'volatile-highlights nil t)
  (volatile-highlights-mode t))

(setq visible-bell t
      inhibit-startup-message t
      initial-scratch-message nil
      shift-select-mode nil
      mouse-yank-at-point t
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      require-final-newline t
      ediff-window-setup-function 'ediff-setup-windows-plain)


(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq frame-title-format '(buffer-file-name "%f" ("%b")))

(set-default 'cursor-type '(bar . 2))
(setq default-frame-alist
  '((cursor-color . "red")))

;; Don't let the cursor go into the minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

(mouse-avoidance-mode 'exile)

(blink-cursor-mode)
(setq use-file-dialog nil)
(setq use-dialog-box nil)


(tooltip-mode -1) ;; Show tooltips in echo area

;; (when (require 'highlight-tail)
;;   ;; (setq highlight-tail-colors '(("black" . 0)
;;   ;;                               ("#CC5500" . 25)
;;   ;;                               ("#bc2525" . 66)))
;;   ;; (setq highlight-tail-colors '(("black" . 0)
;;   ;;                               ("#bc2525" . 25)
;;   ;;                               ("black" . 66)))
;;   (highlight-tail-mode))


;;*==============================================
;; Line wrapping
;;*==============================================
(toggle-truncate-lines 1)
(setq-default truncate-lines t)

;;(setq-default truncate-partial-width-windows t)


(when (require 'rainbow-delimiters nil t)
  (global-rainbow-delimiters-mode))


(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")))

(set-face-underline 'highlight nil)
(set-face-attribute 'region nil :background "#666") ;; Selected textregion.

;; Stand out in zenburn and solarized.
;;(set-face-background 'header-line "grey90")
;; (set-face-background 'header-line "black")
;; (set-face-foreground 'header-line "white")


;; Other stuff that fades into the background
;; (eval-after-load 'anything-config
;;   '(progn
;;      (set-face-foreground 'anything-file-name "white")))


(provide 'cnb-ui)
