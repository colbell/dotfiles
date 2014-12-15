(message (concat "[CNB] - Loading [" load-file-name "]"))


(defun cnb/install-packages()
  "Install packages from package-manager"
  (interactive)
  (package-refresh-contents)

  (setq cnb/packages
        '(
                       helm-c-yasnippet
                       helm-projectile
                       helm-rails
                       mo-git-blame
                       muttrc-mode
                       robe
                       rspec-mode
                       rubocop
                       ruby-compilation
                       ruby-block
                       ruby-end
                       ruby-refactor
                       rvm
                       slamhound
                       yasnippet
                       ))

  (dolist (p cnb/packages)
    (when (not (package-installed-p p))
      (package-install p)))

  (message "Package install completed."))

(provide 'cnb-elpa)
