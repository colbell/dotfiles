;;*==============================================
;; Helm - Anything successor
;;*==============================================
(when (require 'helm-config nil t)
  (setq helm-c-use-adaptative-sorting t)
  (setq ido-use-virtual-buffers t) ;; used by helm?
  (helm-mode 1)
  (require 'helm-git nil t)

  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-c h") 'helm-mini)
  (global-set-key "\M-." 'helm-c-etags-select)
  (global-set-key [f11] 'helm-for-files)

  (when (fboundp 'helm-M-x)
    (global-set-key (kbd "M-x") 'helm-M-x)))

  (when (fboundp 'helm-M-x)
    (global-set-key (kbd "C-x C-M-f") 'helm-git-find-files))

(provide 'cnb-helm)
