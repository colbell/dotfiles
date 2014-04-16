(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; saveplace

;; Remember current position in file.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" user-emacs-directory))


;;;; desktop

;; Remember open buffers
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-load-locked-desktop nil)
(setq desktop-restore-eager 10) ;; Open first X immed then rest in background
;;(setq desktop-restore-eager t)
(setq history-length 250)

(add-to-list 'desktop-modes-not-to-save 'dired-mode)

;;;; savehist

;; Remember mini-buffer history
(setq savehist-additional-variables
      '(search-ring regexp-search-ring kill-ring compile-history))
(savehist-mode t)

(provide 'cnb-sessions)
