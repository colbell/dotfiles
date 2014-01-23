(message (concat "[CNB] - Loading [" load-file-name "]"))

;; I press these too often
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; How often do I key a comma without a trailing space?
;; Commented out as I just can't stop pressing the space-bar
;;(global-set-key (kbd ",") (lambda() (interactive) (insert ", ")))

(when (fboundp 'goto-last-change)
  (global-set-key (kbd "M-? .") 'goto-last-change)
  (global-set-key (kbd "M-? ,") 'goto-last-change-reverse))

;; When you drag and drop a file into an Emacs buffer open it instead
;; of inserting it into the current buffer
(define-key global-map [ns-drag-file] 'ns-find-file)

(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;;(global-set-key (kbd "C-M-h") 'backward-kill-word)

(global-set-key (kbd "M-/") 'hippie-expand)

;;(global-set-key (kbd "C-x \\") 'align-regexp)

;; (global-set-key (kbd "C-c k") 'browse-kill-ring)

(global-set-key (kbd "C-c C-e") 'flymake-display-err-menu-for-current-line)

(define-key ctl-x-4-map "t" 'cnb-toggle-frame-split)


(global-set-key (kbd "<f8> <f1>") 'repeat-complex-command)


;; (global-set-key (kbd "<up>") (lambda () (interactive) (scroll-down 1)))
;; (global-set-key (kbd "<down>") (lambda () (interactive) (scroll-up 1)))

;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; orig alt X

;;(global-set-key "\M-?" 'etags-select-find-tag-at-point)
;;(global-set-key "\M-." 'etags-select-find-tag)
;;helm-c-etags-select
;;(global-set-key [f8]  'shell-current-directory)


;;(global-set-key [f11] 'my-anything)
;;(global-set-key [f11] 'helm-mini)

;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key (kbd "C-c b") 'org-iswitchb)
;; (global-set-key (kbd "C-c r") 'org-remember)


;;(global-set-key (kbd "C-x b") 'anything-mini)
;; (when (fboundp 'anything-imenu)
;;   (global-set-key (kbd "C-x b") 'my-anything-buffer-func)
;;   (global-set-key (kbd "C-x f") 'anything-recentf)
;;   (global-set-key (kbd "C-x C-i") 'anything-imenu))

(global-set-key (kbd "C-x C-i") 'imenu)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


(when (require 'expand-region nil t)
  (global-set-key (kbd "C-=") 'er/expand-region))

;; Same as O in vim
(global-set-key (kbd "C-o")
                '(lambda ()
                   (interactive)
                   (beginning-of-line)
                   (open-line 1)
                   (indent-according-to-mode)))


(when (require 'key-chord nil t)
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.2)

  (key-chord-define-global              "qr"   'query-replace-regexp)
  (key-chord-define emacs-lisp-mode-map "qv"   'eval-region)
)

(provide 'cnb-global-keys)
