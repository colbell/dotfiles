(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; RUBY

(when (require 'ruby-mode nil t)
  (when (require 'ruby-block nil t)
    (setq ruby-block-highlight-toggle t))

  (require 'rubocop nil t)

  (add-hook 'ruby-mode-hook
            (lambda ()
              ;;(ignore-errors(robe-mode))

              (cond
               ((file-directory-p (concat (getenv "HOME") "/.rbenv"))
                (when (require 'rbenv nil t)
                  (setq rbenv-show-active-ruby-in-modeline nil)))
               ((file-directory-p (concat (getenv "HOME") "/.rvm"))
                (when (require 'rvm nil t)
                  (rvm-activate-corresponding-ruby))))

              (when (featurep 'ruby-block)
                (ruby-block-mode t))
              ;;(auto-fill-mode)
              (outline-minor-mode)
              (ruby-refactor-mode-launch)
              (ignore-errors
                (diminish 'ruby-refactor-mode "RR"))

              ;;(subword-mode +1)
              ;;(inf-ruby-setup-keybindings)
              ;;(robe-mode)
              (setq imenu-generic-expression
                    '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)
                      ))

              (setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")))




  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  (require 'rspec-mode nil t)

  ;; (when (require 'rinari nil t)
  ;;   (global-rinari-mode))

  ;; Doesn't work well with Solarized theme. Can't see assignment operator.
  ;;(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

  ;; (set-face-foreground 'enh-ruby-op-face "#CC9393")
  ;; (set-face-foreground 'enh-ruby-heredoc-delimiter-face "tomato")

  (cond
   ((file-directory-p (concat (getenv "HOME") "/.rbenv"))
    (require 'rbenv nil t))
   ((file-directory-p (concat (getenv "HOME") "/.rvm"))
    (require 'rvm nil t)))

  (defun cnb-ruby-setup ()
    ;; (setq imenu-generic-expression
    ;;       '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)))
    (yard-mode)
    (rspec-mode)
    (ruby-refactor-mode-launch)
    )

(add-hook 'ruby-mode-hook 'cnb-ruby-setup))

(provide 'cnb-ruby)

