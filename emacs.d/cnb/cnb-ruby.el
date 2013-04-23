;;(require 'ruby-end nil t)

(require 'rspec-mode nil t)

(when (require 'ruby-mode nil t)
  (when (require 'ruby-block nil t)
    (setq ruby-block-highlight-toggle t))

  (require 'rubocop nil t)

  (add-hook 'ruby-mode-hook
            (lambda () (ignore-errors(rvm-activate-corresponding-ruby))
              (ignore-errors(rbenv-use-corresponding))
              (ignore-errors(setq rbenv-show-active-ruby-in-modeline nil))
              ;;(add-hook 'ruby-mode-hook 'robe-mode)
              (when (featurep 'ruby-block)
                (ruby-block-mode t))
              ;;(auto-fill-mode)
              (outline-minor-mode)
              ;;(subword-mode +1)
              ;;(inf-ruby-setup-keybindings)
              (robe-mode)
              (setq imenu-generic-expression
                 '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)
                   ))


              (setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")))

  (eval-after-load 'ruby-mode
    '(progn
       (ignore-errors (require 'ruby-compilation))

       ;; The ruby-mode in ELPA (20110630) uses an EMACS variable last-command-char which has been replaced
       ;; by last-command-event. This is needed until ruby-mode catches up.
       (ignore-errors (defvaralias 'last-command-char 'last-command-event))

       (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
       (setq comint-process-echoes t)))


  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))

  (when (require 'flymake-ruby nil t)
    (add-hook 'ruby-mode-hook 'flymake-ruby-load))

  (when (require 'rinari nil t)
    (global-rinari-mode)))

(provide 'cnb-ruby)
