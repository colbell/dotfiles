(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; helm

(require 'helm-config nil t)

(when (require 'helm-config nil t)
  (global-set-key "\M-x" 'helm-M-x)

  (global-set-key [remap occur] 'helm-occur)
  (global-set-key [remap list-buffers] 'helm-buffers-list)
  (global-set-key [remap dabbrev-expand] 'helm-dabbrev)
  (global-set-key (kbd "C-c h") 'helm-mini)
  (global-set-key "\C-cf" 'helm-recentf)
  (helm-mode 1)

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
