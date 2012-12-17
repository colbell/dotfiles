;;(setq redisplay-dont-pause nil) ;; Possibly stop emacs-snapshot from locking up.
(setq redisplay-dont-pause t)

(setq sentence-end-double-space nil)
(setq apropos-do-all t)
(auto-image-file-mode)

(set-default 'indent-tabs-mode nil)

(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(setenv "PAGER" "cat")
(show-paren-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1)

(setq confirm-kill-emacs 'y-or-n-p)

(setq completion-cycle-threshold 5)

(when (require 'volatile-highlights nil t)
  (volatile-highlights-mode t))

(setq visible-bell t
      inhibit-startup-message t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      x-select-enable-clipboard t
      require-final-newline t
      truncate-partial-width-windows nil
      ediff-window-setup-function 'ediff-setup-windows-plain)

(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(mouse-avoidance-mode 'exile)
(menu-bar-mode -1)
(tool-bar-mode -1)
(mouse-wheel-mode t)
(blink-cursor-mode)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position t)

(require 'smooth-scrolling nil t)

(tooltip-mode -1) ;; Show tooltips in echo area

;; Should match xresources file
(set-frame-font "Inconsolata-11" nil t)

;; (if window-system
;;     (progn
;;       (add-to-list 'default-frame-alist '(background-color . "black"))
;;       (add-to-list 'default-frame-alist '(foreground-color . "wheat"))))
;;       (ignore-errors
;;         ;;(load-theme 'solarized-dark t)
;;         (load-theme 'zenburn t))
;;       (mouse-avoidance-mode 'exile))
;;   (progn
;;     (set-background-color 'black)
;;     (set-foreground-color 'white)))

(ignore-errors
  (load-theme 'zenburn t))

;; (when (require 'highlight-tail)
;;   ;; (setq highlight-tail-colors '(("black" . 0)
;;   ;;                               ("#CC5500" . 25)
;;   ;;                               ("#bc2525" . 66)))
;;   (setq highlight-tail-colors '(("black" . 0)
;;                                 ("#bc2525" . 25)
;;                                 ("black" . 66)))
;;   (highlight-tail-mode))


;;*==============================================
;; shift + arrow keys to move between windows
;;*==============================================
(require 'windmove)
(windmove-default-keybindings)


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

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-section-title "blue")
     (set-face-foreground 'magit-branch "orange")
     (set-face-foreground 'magit-diff-add "green3")))


;; Other stuff that fades into the background
;; (eval-after-load 'anything-config
;;   '(progn
;;      (set-face-foreground 'anything-file-name "white")))


(provide 'cnb-ui)
