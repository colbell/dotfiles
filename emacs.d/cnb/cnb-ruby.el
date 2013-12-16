(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; RUBY


;;(require 'ruby-end nil t)
;;(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)

(when (require 'enh-ruby-mode nil t)

  (cond
   ((file-directory-p (concat (getenv "HOME") "/.rbenv"))
    (require 'rbenv nil t))
   ((file-directory-p (concat (getenv "HOME") "/.rvm"))
    (require 'rvm nil t)))

  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  (require 'rspec-mode nil t)

  ;; (when (require 'rinari nil t)
  ;;   (global-rinari-mode))

  ;; Doesn't work well with Solarized theme. Can't see assignment operator.
  ;;(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

  (cond
   ((file-directory-p (concat (getenv "HOME") "/.rbenv"))
    (require 'rbenv nil t))
   ((file-directory-p (concat (getenv "HOME") "/.rvm"))
    (require 'rvm nil t)))

  (add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Vagrantfile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.prawn$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))

  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

  (setq enh-ruby-bounce-deep-indent t)
  (setq enh-ruby-hanging-brace-indent-level 2)

  (define-key enh-ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)

  (defun cnb-ruby-setup ()
    (setq imenu-generic-expression
          '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)))
    (yard-mode)
    (rspec-mode)
    (ruby-refactor-mode-launch))

  (add-hook 'enh-ruby-mode-hook 'cnb-ruby-setup))

(provide 'cnb-ruby)

            ;; (when (require 'ruby-mode nil t)
            ;;   (when (require 'ruby-block nil t)
            ;;     (setq ruby-block-highlight-toggle t))

            ;;   (require 'rubocop nil t)

            ;;   (add-hook 'ruby-mode-hook
            ;;             (lambda ()
            ;;               ;;(ignore-errors(robe-mode))

            ;;               (cond
            ;;                ((file-directory-p (concat (getenv "HOME") "/.rbenv"))
            ;;                 (when (require 'rbenv nil t)
            ;;                   (setq rbenv-show-active-ruby-in-modeline nil)))
            ;;                ((file-directory-p (concat (getenv "HOME") "/.rvm"))
            ;;                 (when (require 'rvm nil t)
            ;;                   (rvm-activate-corresponding-ruby))))

            ;;               (when (featurep 'ruby-block)
            ;;                 (ruby-block-mode t))
            ;;               ;;(auto-fill-mode)
            ;;               (outline-minor-mode)
            ;;               (ruby-refactor-mode-launch)
            ;;               (ignore-errors
            ;;                 (diminish 'ruby-refactor-mode "RR"))

            ;;               ;;(subword-mode +1)
            ;;               ;;(inf-ruby-setup-keybindings)
            ;;               ;;(robe-mode)
            ;;               (setq imenu-generic-expression
            ;;                     '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)
            ;;                       ))

            ;;               (setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")))


