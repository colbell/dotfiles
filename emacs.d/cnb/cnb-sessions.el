(message (concat "[CNB] - Loading [" load-file-name "]"))

;; Remember current position in file.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" user-emacs-directory))

;; Remember open buffers
(require 'desktop)
(setq desktop-load-locked-desktop nil) ;; FIXME: This isn't working - always set to ask
(setq desktop-restore-eager 5) ;; Open first X immed then rest in background
(desktop-save-mode 1)

;; Remember mini-buffer history
(setq savehist-additional-variables
      '(search-ring regexp-search-ring kill-ring compile-history))
(savehist-mode t)

(provide 'cnb-sessions)
