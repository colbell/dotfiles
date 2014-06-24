(message (concat "[CNB] - Loading [" load-file-name "]"))

;; Taken out as it causes random "Selecting deleted buffer" errors

(when (require 'git-gutter nil t)
  ;(setq git-gutter-fr:side 'right-fringe);; Causes probs with flycheck if on LHS
  (global-git-gutter-mode)
  (git-gutter:linum-setup))

(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines t)

(provide 'cnb-fringe)
