(message (concat "[CNB] - Loading [" load-file-name "]"))

(defun cnb/php-mode-init ()
  (setq case-fold-search t)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 2)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0))

(add-hook 'php-mode-hook 'cnb/php-mode-init)

(provide 'cnb-php)
