(message (concat "[CNB] - Loading [" load-file-name "]"))

(require 'ibuffer)
(setq ibuffer-default-sorting-mode 'alphabetic)

(setq ibuffer-expert t) ;; Don't prompt closing unmodified buffers
(setq ibuffer-show-empty-filter-groups nil)

;;(require 'ibuffer-vc nil t)

(defadvice ibuffer (around ibuffer-point-to-most-recent activate) ()
           "Open ibuffer with cursor at most recently viewed buffer."
           (let ((current-buffer-name (buffer-name)))
             ad-do-it
             (ibuffer-jump-to-buffer current-buffer-name)))

(setq ibuffer-formats
      '((mark modified read-only" "
              (name 30 30 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("ruby" (or
                        (mode . rinari-mode)
                        (mode . enh-ruby-mode)
                        (mode . ruby-mode)))
               ("lisp" (or (mode . emacs-lisp-mode)
                           (mode . lisp-interaction-mode)
                           (mode . lisp-mode)))
               ("clojure" (or (mode . clojure-mode)
                              (mode . clojure-test-mode)))
               ("java" (mode . java-mode))
               ("js" (or
                      (mode . coffee-mode)
                      (mode . js-mode)
                      (mode . espresso-mode)))
               ("css" (or
                       (mode . sass-mode)
                       (mode . css-mode)
                       (mode . scss-mode)))
               ("scala" (or
                         (mode . scala-mode)
                         (mode . sbt-mode)))
               ("code" (or
                        (mode . haskell-mode)
                        (mode . lua-mode)
                        (mode . python-mode)))
               ("web markup" (or
                          (mode . php-mode)
                          (mode . haml-mode)
                          (mode . slim-mode)
                          (mode . html-mode)
                          (mode . rhtml-mode)
                          (name . ".rhtml")
                          (mode . nXhtml-mode)
                          (mode . web-mode)))
               ("markup" (or
                          (mode . nxml-mode)
                          (mode . yaml-mode)
                          (mode . markdown-mode)))
               ("conf" (or
                        (mode . muttrc-mode)
                        (mode . conf-xdefaults-mode)
                        (mode . conf-mode)
                        (mode . conf-unix-mode)
                        (mode . conf-space-mode)
                        (mode . conf-colon-mode)
                        (name . "\.env")))
               ("dired" (mode . dired-mode))
               ("browser" (or
                       (mode . doc-view-mode)
                       (mode . eww-mode)
                       (mode . help-mode)
                       (mode . Man-mode)
                       (mode . woman-mode)))
               ("org" (or
                       (name . "^\\*Calendar\\*$")
                       (name . "^diary$")
                       (mode . latex-mode)
                       (mode . org-mode)
                       (mode . muse-mode)))
               ("shell-script" (mode . sh-mode))
               ("compilation" (or
                               (name . "^\\*Compile-Log\\*$")
                               (mode . ruby-compilation-mode)))
               ("term" (or
                        (mode . term-mode)
                        (mode . inf-ruby-mode)
                        (mode . sql-interactive-mode)))
               ("source control" (or
                                  (mode . magit-mode)
                                  (mode . magit-commit-mode)
                                  (mode . magit-status-mode)
                                  (mode . git-commit-mode)
                                  (name . "^magit")
                                  (name . "magit")))
               ("jabber" (or
                          (mode . jabber-roster-mode)
                          (mode . jabber-chat-mode)))
               ("Emacs customisation" (mode . Custom-mode))
               ("mail" (or
                        (mode . bbdb-mode)
                        (mode . gnus-article-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (name . "\.bbdb")
                        (name . "\.newsrc-dribble")
                        (mode . mu4e-main-mode)
                        (mode . mu4e-headers-mode)
                        ;;(mode . rmail-mode)
                        (mode . mu4e-view-mode)
                        (mode . mu4e-compose-mode)))
               ("helm" (or
                        (mode . helm-mode)
                        (name . "^\\*helm")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")
            (visual-line-mode -1)))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(define-key ibuffer-mode-map "e" 'ibuffer-ediff-marked-buffers)


(eval-after-load "ibuf-ext"
  '(define-ibuffer-filter filename
     "Toggle current view to buffers with file or directory name matching QUALIFIER."
     (:description "filename"
                   :reader (read-from-minibuffer "Filter by file/directory name (regexp): "))
     (ibuffer-awhen (or (buffer-local-value 'buffer-file-name buf)
                        (buffer-local-value 'dired-directory buf))
                    (string-match qualifier it))))

(provide 'cnb-ibuffer)
