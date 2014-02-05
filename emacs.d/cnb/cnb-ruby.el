(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; RUBY

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


(add-hook 'projectile-mode-hook 'projectile-rails-on)
(require 'rspec-mode nil t)
(require 'flymake-ruby nil t)

(defun cnb-ruby-setup ()
  (setq imenu-generic-expression
        '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)))
  (yard-mode)
  ;;(auto-fill-mode)
  (outline-minor-mode)
  (when (featurep 'ruby-block)
    (ruby-block-mode t))
  (when (featurep 'flymake-ruby)
    (flymake-ruby-load))
  (ignore-errors
    (ruby-refactor-mode-launch)
    (diminish 'ruby-refactor-mode "RR"))
  ;; (set (make-local-variable imenu-generic-expression)
  ;;      '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)
  ;;        ))
  ;;(subword-mode +1)
  (robe-mode)
  (setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")  )

(when (require 'ruby-mode nil t)
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

  (add-hook 'ruby-mode-hook 'cnb-ruby-setup))

(provide 'cnb-ruby)

