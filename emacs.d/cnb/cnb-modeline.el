(message (concat "[CNB] - Loading [" load-file-name "]"))


;; Dimnish minor-mode clutter
(ignore-errors (diminish 'Eldoc-mode))
;;(ignore-errors (diminish 'abbrev-mode))
;;(ignore-errors (diminish 'anzu-mode))
(ignore-errors (diminish 'cider-mode))
(ignore-errors (diminish 'color-identifiers-mode))
(ignore-errors (diminish 'company-mode))
(ignore-errors (diminish 'compilation-in-progress))
(ignore-errors (diminish 'diminish-mode))
(ignore-errors (diminish 'drag-stuff-mode))
(ignore-errors (diminish 'eldoc-mode))
;;(ignore-errors (diminish 'flymake-mode))
(ignore-errors (diminish 'git-gutter-mode))
(ignore-errors (diminish 'global-whitespace-mode))
(ignore-errors (diminish 'helm-mode))
(ignore-errors (diminish 'hi-lock-mode))
(ignore-errors (diminish 'magit-auto-revert-mode))
(ignore-errors (diminish 'rinari-minor-mode))
(ignore-errors (diminish 'ruby-block-mode))
(ignore-errors (diminish 'ruby-refactor-mode))
(ignore-errors (diminish 'undo-tree-mode))
(ignore-errors (diminish 'volatile-highlights-mode))
;;(ignore-errors (diminish 'whitespace-mode))
(ignore-errors (diminish 'yard-mode))
(ignore-errors (diminish 'yas-minor-mode))

;; Diminish major mode-clutter
;; From http://whattheemacsd.com/
(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

;; Shorten major mode names
(rename-modeline "js" js-mode "JS")
(rename-modeline "lisp-mode" emacs-lisp-mode "EL")
(rename-modeline "clojure-mode" clojure-mode "CLJ")

(provide 'cnb-modeline)
