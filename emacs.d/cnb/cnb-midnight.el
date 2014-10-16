(message (concat "[CNB] - Loading [" load-file-name "]"))

;;==============
;; Purge unused buffers
;;==============
(require 'midnight)
;; (add-to-list 'clean-buffer-list-kill-never-buffer-names "*info*")
;; (add-to-list 'clean-buffer-list-kill-never-buffer-names "*scratch*")

(setq clean-buffer-list-delay-general 2)

(provide 'cnb-midnight)
