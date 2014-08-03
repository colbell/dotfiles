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



;;(global-set-key (kbd "C-x \\") 'align-regexp)

;; (global-set-key (kbd "C-c k") 'browse-kill-ring)


(global-set-key (kbd "C-c C-e") 'flymake-display-err-menu-for-current-line)

(define-key ctl-x-4-map "t" 'cnb/toggle-frame-split)

(global-set-key (kbd "C-<return>") 'rectangle-mark-mode)

(global-set-key (kbd "<f8> <f1>") 'repeat-complex-command)

(global-set-key [f6]  'recentf-open-files)

(global-set-key [f7]  'hl-line-flash)

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

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


(when (require 'expand-region nil t)
  (global-set-key (kbd "C-=") 'er/expand-region))


;; Ctrl-x t key map for toggling modes. Idea from
;; http://endlessparentheses.com/the-toggle-map-and-wizardry.html
(define-prefix-command 'cnb/toggle-map)
(define-key ctl-x-map "t" 'cnb/toggle-map)
(define-key cnb/toggle-map "d" 'toggle-debug-on-error)
(define-key cnb/toggle-map "l" 'linum-mode)
(define-key cnb/toggle-map "n" 'cnb/narrow-or-widen-dwim)
(define-key cnb/toggle-map "r" 'dired-toggle-read-only)
(define-key cnb/toggle-map "v" 'visual-line-mode)


(provide 'cnb-global-keys)
