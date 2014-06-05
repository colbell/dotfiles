(message (concat "[CNB] - Loading [" load-file-name "]"))

;; Taken out as it causes random "Selecting deleted buffer" errors

;; (require 'git-gutter-fringe nil t)
;; (when (fboundp 'global-git-gutter-mode)
;;   (setq git-gutter-fr:side 'right-fringe);; Causes probs with flycheck if on LHS
;;   (global-git-gutter-mode))

(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines t)

(provide 'cnb-fringe)
