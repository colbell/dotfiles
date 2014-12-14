(message (concat "[CNB] - Loading [" load-file-name "]"))

;; I press these too often
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))



;; When you drag and drop a file into an Emacs buffer open it instead
;; of inserting it into the current buffer
(define-key global-map [ns-drag-file] 'ns-find-file)


;;(global-set-key (kbd "C-M-h") 'backward-kill-word)



;;(global-set-key (kbd "C-x \\") 'align-regexp)

;; (global-set-key (kbd "C-c k") 'browse-kill-ring)


;;(global-set-key (kbd "C-c C-e") 'flymake-display-err-menu-for-current-line)



(global-set-key (kbd "C-<return>") 'rectangle-mark-mode)

(global-set-key (kbd "<f8> <f1>") 'repeat-complex-command)

;;(global-set-key [f6]  'recentf-open-files)

;;(global-set-key [f7]  'hl-line-flash)

(global-set-key (kbd "C-h C-m") 'discover-my-major)

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




(provide 'cnb-global-keys)
