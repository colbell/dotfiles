(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; GIT

(when (require 'magit nil t)

  (setq magit-diff-refine-hunk t)
  (setq magit-process-popup-time 60)

  ;; Show magit-status in full window and restore window config on quit.
  ;; (defadvice magit-status (around magit-fullscreen activate)
  ;;   (window-configuration-to-register :magit-fullscreen)
  ;;   ad-do-it
  ;;   (delete-other-windows))

  ;; (defun magit-quit-session ()
  ;;   "Restores the previous window configuration and kills the magit buffer"
  ;;   (interactive)
  ;;   (kill-buffer)
  ;;   (jump-to-register :magit-fullscreen))

  ;; (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

  (defun magit-toggle-whitespace ()
    (interactive)
    (if (member "-w" magit-diff-options)
        (magit-dont-ignore-whitespace)
      (magit-ignore-whitespace)))

  (defun magit-ignore-whitespace ()
    (interactive)
    (add-to-list 'magit-diff-options "-w")
    (magit-refresh))

  (defun magit-dont-ignore-whitespace ()
    (interactive)
    (setq magit-diff-options (remove "-w" magit-diff-options))
    (magit-refresh))

  (if magit-status-mode-map
      (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace))

  (add-hook 'magit-log-edit-mode-hook 'flyspell-mode)
  (add-hook 'git-commit-mode-hook 'flyspell-mode)

  ;;(eval-after-load 'magit
    ;;'(progn
       ;;(set-face-foreground 'magit-section-title "blue")))
       ;;(set-face-foreground 'magit-branch "orange")
       ;;(set-face-foreground 'magit-diff-add "green3")))

  (global-set-key (kbd "C-c g") 'magit-status))

(when (require 'git-messenger nil t)
  (global-set-key (kbd "C-x v p") 'git-messenger:popup-message))

(provide 'cnb-sc)
