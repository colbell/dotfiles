;; I press this too often
(global-unset-key (kbd "C-x C-z"))

;;(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)
;;helm-c-etags-select
(global-set-key [f8]  'shell-current-directory)

(when (fboundp 'bm-toggle)
  (global-set-key (kbd "<C-f2>") 'bm-toggle)
  (global-set-key (kbd "<f2>")   'bm-next)
  (global-set-key (kbd "<S-f2>") 'bm-previous)
)

;;(global-set-key [f11] 'my-anything)
;;(global-set-key [f11] 'helm-mini)

(global-set-key [f11] 'recentf-open-files)

;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key (kbd "C-c b") 'org-iswitchb)
;; (global-set-key (kbd "C-c r") 'org-remember)


;;(global-set-key (kbd "C-x b") 'anything-mini)
;; (when (fboundp 'anything-imenu)
;;   (global-set-key (kbd "C-x b") 'my-anything-buffer-func)
;;   (global-set-key (kbd "C-x f") 'anything-recentf)
;;   (global-set-key (kbd "C-x C-i") 'anything-imenu))

;; When you drag and drop a file into an Emacs buffer open it instead
;; of inserting it into the current buffer
(define-key global-map [ns-drag-file] 'ns-find-file)

(global-set-key (kbd "C-'") 'other-window)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(when (fboundp 'helm-buffers-list)
  (global-set-key (kbd "C-x b") 'helm-buffers-list))
(when (fboundp 'helm-find-files)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))
(global-set-key (kbd "C-c h") 'helm-mini)

(when (fboundp 'helm-M-x)
  (global-set-key (kbd "M-x") 'helm-M-x))

(global-set-key (kbd "C-c g") 'magit-status)

(global-set-key (kbd "C-M-h") 'backward-kill-word)

(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-x \\") 'align-regexp)

;; (global-set-key (kbd "C-c k") 'browse-kill-ring)

(global-set-key (kbd "C-x C-M-f") 'helm-git-find-files)

(global-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)

(global-set-key (kbd "C-c r") 'rotate-windows)

;; (global-set-key (kbd "<up>") (lambda () (interactive) (scroll-down 1)))
;; (global-set-key (kbd "<down>") (lambda () (interactive) (scroll-up 1)))

;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; orig alt X

(define-key ibuffer-mode-map "e" 'ibuffer-ediff-marked-buffers)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


(when (require 'expand-region nil t)
  (global-set-key (kbd "C-=") 'er/expand-region))

(when (require 'ace-jump-mode nil t)
  (define-key global-map (kbd "C-x SPC") 'ace-jump-mode))

;; Same as O in vim
(global-set-key (kbd "C-o")
                '(lambda ()
                   (interactive)
                   (beginning-of-line)
                   (open-line 1)
                   (indent-according-to-mode)))

(provide 'cnb-global-keys)
