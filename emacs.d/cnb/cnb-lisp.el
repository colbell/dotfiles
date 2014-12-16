(message (concat "[CNB] - Loading [" load-file-name "]"))


(defun cnb/imenu-lisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t)
  (add-to-list 'imenu-generic-expression '("Packages" "(use-package \\(.+\\)$" 1) t))

(setq lisp-modes '(common-lisp-mode
                   clojure-mode
                   emacs-lisp-mode
                   lisp-interaction-mode
                   lisp-mode
                   scheme-mode))

(dolist (mode lisp-modes)
  (add-hook (intern (format "%s-hook" mode)) 'cnb/imenu-lisp-sections))

(provide 'cnb-lisp)
