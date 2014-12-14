(message (concat "[CNB] - Loading [" load-file-name "]"))

;;(setq  disabled-command-hook nil)                 ;; Enable commands disabled by default for novice users
(put 'narrow-to-region 'disabled nil)               ;; ("C-x n n")
(put 'narrow-to-defun 'disabled nil)                ;; ("C-x n d")
(put 'narrow-to-page 'disabled nil)                 ;; ("C-x n p")
(put 'downcase-region 'disabled nil)                ;; ("C-x C-l")
(put 'upcase-region 'disabled nil)                  ;; ("C-x C-u")
(put 'dired-find-alternate-file 'disabled nil)      ;; 'a' in dired mode

;; (put 'erase-buffer 'disabled nil)
;; (global-set-key (kbd "C-c E")  'erase-buffer)

(provide 'cnb-nonstd-cmds)
