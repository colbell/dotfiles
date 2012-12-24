;;
;; Show magit-status in full window and restore window config on quit.

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)


(add-hook 'magit-log-edit-mode-hook 'flyspell-mode)
(add-hook 'git-commit-mode-hook 'flyspell-mode)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-section-title "blue")
     (set-face-foreground 'magit-branch "orange")
     (set-face-foreground 'magit-diff-add "green3")))

(provide 'cnb-sc)
