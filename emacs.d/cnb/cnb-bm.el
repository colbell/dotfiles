(setq bookmark-save-flag 1) ; save bookmarks instantly
(setq bookmark-default-file (expand-file-name "emacs.bmk" user-emacs-directory))

(setq bm-restore-repository-on-load t)
(setq bm-repository-file (expand-file-name "bm-repository" user-emacs-directory))
(setq bm-repository-size 1024)

(when (require 'bm nil t)
  (when (fboundp 'bm-toggle)
    (global-set-key (kbd "<C-f2>") 'bm-toggle)
    (global-set-key (kbd "<f2>")   'bm-next)
    (global-set-key (kbd "<S-f2>") 'bm-previous))

  (setq-default bm-buffer-persistence t)

  ;; Load the repository from file on start up.
  (add-hook' after-init-hook 'bm-repository-load)

  ;; Restore bookmarks on file find.
  (add-hook 'find-file-hooks 'bm-buffer-restore)

  ;; Save bookmark data when killing a buffer
  (add-hook 'kill-buffer-hook 'bm-buffer-save)

  ;; Save the repository to file on exit.
  (add-hook 'kill-emacs-hook '(lambda nil
                                (bm-buffer-save-all)
                                (bm-repository-save)))

  (setq bm-highlight-style 'bm-highlight-only-fringe))

(provide 'cnb-bm)
