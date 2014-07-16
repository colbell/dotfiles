(message (concat "[CNB] - Loading [" load-file-name "]"))

;;(set-face-background 'region "blue")
;;(set-background-color "black")
;;(set-foreground-color "wheat")

;;(add-to-list 'default-frame-alist '(background-color . "black"))
;;(add-to-list 'default-frame-alist '(foreground-color . "wheat"))

;; (set-default 'cursor-type '(bar . 3))
;; (set-cursor-color "DarkOrange")
;; (setq default-frame-alist
;;  '((cursor-color . "DarkOrange")))


;; (set-cursor-color "DarkOrange")
;; (setq default-frame-alist
;;       (append default-frame-alist
;;               '((cursor-color . "DarkOrange"))))

;; (setq default-frame-alist
;;       (append default-frame-alist
;;               '((foreground-color . "wheat")
;;                 (background-color . "gray4")
;;                 (cursor-color . "DarkOrange"))))

(setq frame-title-format '(buffer-file-name "%f" ("%b")))


(ignore-errors
  (setq solarized-distinct-fringe-background nil)
  (load-theme 'solarized-dark t))
  ;;(load-theme 'solarized-light t)
  ;;(load-theme 'wombat t)
  ;;(load-theme 'zenburn t)
  ;;(load-theme 'manoj-dark t)
  ;;(load-theme 'twilight t)

(when (require 'rainbow-delimiters nil t)
  ;; I can't see the default colors in some color schemes
  ;; (require 'cl-lib)
  ;; (require 'color)
  ;; (cl-loop
  ;;  for index from 1 to rainbow-delimiters-max-face-count
  ;;  do
  ;;  (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
  ;;    (cl-callf color-saturate-name (face-foreground face) 75))

  ;; Make unmatched parens stand out.
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground "#88090B"
                      ;;:inherit 'error
                      :strike-through t))

;;(set-frame-font "Anonymous Pro-12" nil t)
;;(set-default-font "Anonymous Pro-12" nil t)
;;(set-frame-font "Inconsolata-11" nil t)
;;(set-default-font "Inconsolata-11" nil t)
;;(set-frame-font "Ubuntu Mono-12" nil t)
;;(set-default-font "Ubuntu Mono-12" nil t)
(set-frame-font "Source Code Pro-11" nil t)
(set-default-font "Source Code Pro-11" nil t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq redisplay-dont-pause t)

(setq sentence-end-double-space nil)
(setq apropos-do-all t)
(auto-image-file-mode)

;; Reuse existing window for compilation windows.
(setq-default display-buffer-reuse-frames t)

(set-default 'indent-tabs-mode nil)

(set-default 'imenu-auto-rescan t)

(setenv "PAGER" "cat")

(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1)

(setq confirm-kill-emacs 'y-or-n-p)

(setq completion-cycle-threshold 5)

;; (when (require 'volatile-highlights nil t)
;;   (volatile-highlights-mode t))

(setq visible-bell t
      inhibit-startup-message t
      initial-scratch-message nil
      shift-select-mode nil
      mouse-yank-at-point t
      ;;x-select-enable-clipboard t
      delete-active-region nil
      ;;x-select-enable-primary t
      save-interprogram-paste-before-kill t
      require-final-newline t
      ediff-window-setup-function 'ediff-setup-windows-plain)

;; Don't let the cursor go into the minibuffer prompt
(setq minibuffer-prompt-properties
      (quote (read-only t point-entered minibuffer-avoid-prompt
                        face minibuffer-prompt)))

(mouse-avoidance-mode 'exile)

(blink-cursor-mode)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

(when (require 'color-identifiers-mode nil t)
  (global-color-identifiers-mode))

;;(tooltip-mode 1) ;; Show tooltips in echo area

;; (when (require 'hilit-chg nil t)
;;   (setq highlight-changes-visibility-initial-state nil)
;;   (global-highlight-changes-mode-check-buffers))

;;*==============================================
;; Line wrapping
;;*==============================================
(toggle-truncate-lines 1)
(setq-default truncate-lines t)

(provide 'cnb-ui)
