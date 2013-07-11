;; Remember current position in file.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" user-emacs-directory))

;; Remember open buffers
(desktop-save-mode 1)

;; Remember mini-buffer history
(setq savehist-additional-variables
      '(search-ring regexp-search-ring kill-ring compile-history))
(savehist-mode t)

(provide 'cnb-sessions)
