(require 'printing)
(pr-update-menus t)

(setenv "CUPS_SERVER" "localhost")
(require 'cups nil t)

(provide 'cnb-print)
