(message (concat "[CNB] - Loading [" load-file-name "]"))

(require 'git-gutter-fringe nil t)

(when (fboundp 'global-git-gutter-mode)
  (global-git-gutter-mode))

(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines t)

(provide 'cnb-fringe)
