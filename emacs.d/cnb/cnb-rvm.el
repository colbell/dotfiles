(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'rvm nil t)
  (rvm-use-default)) ;; use rvm's default ruby as default


(provide 'cnb-rvm)
