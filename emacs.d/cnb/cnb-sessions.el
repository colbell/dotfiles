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
(setq desktop-restore-frames nil) ;; Probs with emacsclient
(setq desktop-load-locked-desktop nil)
(setq desktop-restore-eager 10) ;; Open first X immed then rest in background
;;(setq desktop-restore-eager t)
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(setq desktop-globals-to-save (delete 'tags-file-name desktop-globals-to-save))
(setq desktop-globals-to-save (delete 'tags-table-list desktop-globals-to-save))

;; tags-file-name tags-table-list

;;;; savehist

(setq history-length 250)
(setq savehist-additional-variables
      '(search-ring regexp-search-ring kill-ring compile-history))
(savehist-mode t)

(provide 'cnb-sessions)
