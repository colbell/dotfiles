(setq bookmark-save-flag 1) ; save bookmarks instantly
(setq bookmark-default-file "~/.emacs.d/emacs.bmk")

(setq bm-restore-repository-on-load t)
(when (require 'bm nil t)
  (setq bm-repository-file "~/.emacs.d/bm-repository")
  (setq bm-repository-size 1024)

  ;; (setq-default bm-buffer-persistence t)

  ;; Load the repository from file on start up.
  ;; (add-hook' after-init-hook 'bm-repository-load)

  ;; Restore bookmarks on file find.
  ;; (add-hook 'find-file-hooks 'bm-buffer-restore)

  ;; Save bookmark data when killing a buffer
  ;;(add-hook 'kill-buffer-hook 'bm-buffer-save)

  ;; Save the repository to file on exit.
  ;; (add-hook 'kill-emacs-hook '(lambda nil
  ;;                               (bm-buffer-save-all)
  ;;                               (bm-repository-save)))

  (setq bm-highlight-style 'bm-highlight-only-fringe))


(provide 'cnb-bm)
