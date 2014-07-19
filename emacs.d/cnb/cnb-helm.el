(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; helm

(when (require 'helm-config nil t)
  (setq helm-candidate-number-limit 250)

  ;; Speed helm up. From https://gist.github.com/antifuchs/9238468
  (setq helm-idle-delay 0.0        ; update fast sources immediately (doesn't).
        helm-input-idle-delay 0.01 ; this actually updates things relatively quickly.
        helm-quick-update t
        helm-M-x-requires-pattern nil
        helm-ff-skip-boring-files t
        enable-recursive-minibuffers t)

  (global-set-key "\M-x" 'helm-M-x)
  (global-set-key [remap occur] 'helm-occur)
  (global-set-key [remap list-buffers] 'helm-buffers-list)
  (global-set-key [remap dabbrev-expand] 'helm-dabbrev)
  (global-set-key (kbd "C-o h") 'helm-mini)
  (global-set-key "\C-cf" 'helm-recentf)
  (global-set-key "\C-xb" 'helm-buffers-list)
  (helm-mode 1)


;;;; helm-swoop
  (when (require 'helm-swoop nil t)
    (global-set-key (kbd "M-i") 'helm-swoop))


  ;;;; helm-rails
  (when (require 'helm-rails nil t)
    ;; Define extra finders
    (helm-rails-def-resource 'authorizers "app/authorizers//" "^app/authorizers/(.+)$")
    (helm-rails-def-resource 'cells "app/cells//" "^app/cells/(.+)$")
    (helm-rails-def-resource 'decorators "app/decorators//" "^app/decorators/(.+)$")
    (helm-rails-def-resource 'widgets "app/widgets//" "^app/widgets/(.+)$")
    (helm-rails-def-resource 'workers "app/workers//" "^app/workers/(.+)$")

    (global-set-key (kbd "C-c r a") 'helm-rails-authorizers)
    (global-set-key (kbd "C-c r c") 'helm-rails-controllers)
    (global-set-key (kbd "C-c r d") 'helm-rails-decorators)
    (global-set-key (kbd "C-c r m") 'helm-rails-models)
    (global-set-key (kbd "C-c r s") 'helm-rails-specs)
    (global-set-key (kbd "C-c r v") 'helm-rails-views)
    (global-set-key (kbd "C-c r w") 'helm-rails-widgets)
    (global-set-key (kbd "C-c r o") 'helm-rails-workers)))

(provide 'cnb-helm)
