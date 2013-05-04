(require 'ibuffer)
(setq ibuffer-default-sorting-mode 'major-mode)

(setq ibuffer-expert t) ;; Don't prompt closing unmodified buffers
(setq ibuffer-show-empty-filter-groups nil)

;;(require 'ibuffer-vc nil t)

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
;;              " "
;;               (vc-status 16 16 :left)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("ruby" (or
                        (mode . yaml-mode)
                        (mode . rinari-mode)
                        (mode . ruby-mode)))
               ("lisp" (or (mode . emacs-lisp-mode)
                           (mode . lisp-interaction-mode)
                           (mode . lisp-mode)))
               ("code" (or
                        (mode . haskell-mode)
                        (mode . lua-mode)
                        (mode . python-mode)))
               ("js" (or
                        (mode . coffee-mode)
                        (mode . js-mode)
                        (mode . espresso-mode)))
               ("web" (or
                        (mode . haml-mode)
                        (mode . slim-mode)
                        (mode . sass-mode)
                        (mode . css-mode)
                        (mode . html-mode)
                        (mode . rhtml-mode)
                        (name . ".rhtml")
                        (mode . nXhtml-mode)
                        (mode . espresso-mode)))
               ("term" (mode . term-mode))
               ("git" (or
                       (mode . magit-mode)
                       (mode . magit-commit-mode)
                       (mode . magit-status-mode)
                       (name . "^magit")
                       (name . "magit")
                       (name . "magit")))
               ("conf" (or
                        (mode . muttrc-mode)
                        (mode . conf-xdefaults-mode)
                        (mode . conf-mode)
                        (mode . conf-unix-mode)
                        (mode . conf-space-mode)))
               ("help"(or
                       (mode . help-mode)
                       (mode . Man-mode)
                       (mode . woman-mode)))
               ("org" (or
                       (name . "^\\*Calendar\\*$")
                       (name . "^diary$")
                       (mode . latex-mode)
                       (mode . org-mode)
                       (mode . muse-mode)))
               ("helm" (or
                        (mode . helm-mode)
                        (name . "^\\*helm")
                        ))
               ("shell-script" (mode . sh-mode))
               ("gnus" (or
                        (mode . bbdb-mode)
                        (mode . gnus-article-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (name . "\.bbdb")
                        (name . "\.newsrc-dribble")))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(define-key ibuffer-mode-map "e" 'ibuffer-ediff-marked-buffers)

(provide 'cnb-ibuffer)
