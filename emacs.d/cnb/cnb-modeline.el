(message (concat "[CNB] - Loading [" load-file-name "]"))

(line-number-mode t)
(column-number-mode t)
(size-indication-mode)

;; Broken with emacs-snapshot
;;(when (require 'powerline nil t)
;;  (powerline-default-theme))

;;(set-face-foreground 'mode-line-buffer-id "darkgray")

;; Display time and local mail indicator.

;;(defface cnb-display-time-mail-face '((t (:background "red"))) "bg color for mail indicator")

;; (setq  display-time-mail-file "/var/mail/colbell"
;;        display-time-use-mail-icon t
;;        display-time-24hr-format t
;;        display-time-mail-face 'cnb-display-time-mail-face)
(display-time-mode t)

;; Show current function name in modeline
(when (require 'which-func nil t)
  (which-func-mode 1))
;;  (add-to-list 'which-func-modes 'ruby-mode))
;; (set-face-foreground 'which-func "gainsboro")
;; (set-face-background 'which-func "blue"))

;; (eval-after-load 'which-func
;;   '(progn
;;      (set-face-attribute 'which-func nil :weight 'bold)
;;      (set-face-foreground 'which-func "cyan")))

;; Display current match and total matches information in the mode-line
(when (require 'anzu nil t)
  (global-anzu-mode +1)
  (setq anzu-search-threshold 1000))
  ;; (set-face-attribute 'anzu-mode-line nil
  ;;                     :foreground "yellow" :weight 'bold))

;; Battery status
(require 'battery)
(when (and battery-status-function
           (not (string-match-p "N/A"
                                (battery-format "%B"
                                                (funcall battery-status-function)))))
  (setq battery-mode-line-format "[%b%p%%%% %t]")
  (display-battery-mode 1))

;; Dimnish minor-mode clutter
(ignore-errors (diminish 'Eldoc-mode))
(ignore-errors (diminish 'abbrev-mode))
(ignore-errors (diminish 'anzu-mode))
(ignore-errors (diminish 'color-identifiers-mode))
(ignore-errors (diminish 'compilation-in-progress "COMP"))
(ignore-errors (diminish 'diminish-mode))
(ignore-errors (diminish 'drag-stuff-mode))
(ignore-errors (diminish 'flymake-mode))
(ignore-errors (diminish 'git-gutter-mode))
(ignore-errors (diminish 'global-whitespace-mode))
(ignore-errors (diminish 'helm-mode))
(ignore-errors (diminish 'hi-lock-mode))
(ignore-errors (diminish 'magit-auto-revert-mode))
(ignore-errors (diminish 'magit-mode))
(ignore-errors (diminish 'projectile-mode "PRJ"))
(ignore-errors (diminish 'projectile-rails-mode "PRJR"))
(ignore-errors (diminish 'rinari-minor-mode "RIN"))
(ignore-errors (diminish 'ruby-block-mode))
(ignore-errors (diminish 'ruby-refactor-mode))
(ignore-errors (diminish 'undo-tree-mode))
(ignore-errors (diminish 'volatile-highlights-mode))
(ignore-errors (diminish 'whitespace-mode))
(ignore-errors (diminish 'yard-mode))
(ignore-errors (diminish 'yas-minor-mode))

;; Diminish major mode-clutter
;; From http://whattheemacsd.com/
(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js" js-mode "JS")
(rename-modeline "lisp-mode" emacs-lisp-mode "EL")

(provide 'cnb-modeline)
