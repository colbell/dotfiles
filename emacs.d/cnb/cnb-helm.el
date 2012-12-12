;;*==============================================
;; Helm - Anything successor
;;*==============================================
(when (require 'helm-config nil t)
  (setq helm-c-use-adaptative-sorting t)
  (setq ido-use-virtual-buffers t)
  (helm-mode 1)
  (require 'helm-git nil t))

(provide 'cnb-helm)
