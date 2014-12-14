(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; LISP

;; (when (fboundp 'key-chord-define)
;;   (key-chord-define lisp-mode-shared-map "qv" 'eval-region)
;;   (key-chord-define lisp-mode-shared-map "qb" 'eval-buffer))

;; (use-package clojure-mode
;;   :ensure clojure-mode

;;   :init
;;   (progn
;;     (add-hook 'clojure-mode-hook 'cider-mode)
;;     (add-hook 'clojure-mode-hook
;;               (lambda ()
;;                 (clj-refactor-mode 1)
;;                 (cljr-add-keybindings-with-prefix "C-o C-r")))

;;     (define-key clojure-mode-map (kbd "C-o j") 'cider-jack-in)
;;     (define-key clojure-mode-map (kbd "C-o J") 'cider-restart)
;;     (define-key clojure-mode-map (kbd "C-o a") 'align-cljlet)))

;; (use-package cider
;;   :ensure cider

;;   :init
;;   (progn
;;     (defalias 'cveb 'cider-visit-error-buffer)
;;     (setq nrepl-log-messages t)
;;     (require 'cider-eldoc)
;;     (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;;     (add-hook 'cider-repl-mode-hook 'subword-mode)
;;     ;;(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
;;     (setq cider-repl-use-clojure-font-lock t)
;;     (setq nrepl-hide-special-buffers t)
;;     (setq cider-show-error-buffer nil)
;;     (setq cider-auto-select-error-buffer nil)
;;     (setq cider-repl-pop-to-buffer-on-connect nil)
;;     (setq cider-repl-history-file "~/.emacs.d/cider-repl-history")
;;     (setq cider-repl-history-size 1000)))

;; (use-package cider-decompile
;;   :ensure cider-decompile)

;; (use-package align-cljlet
;;   :ensure align-cljlet)

;; (use-package clj-refactor
;;   :ensure clj-refactor)

;; (use-package clojure-mode-extra-font-locking
;;   :ensure clojure-mode-extra-font-locking)

;; (use-package clojure-cheatsheet
;;   :ensure clojure-cheatsheet
;;   :init
;;   (progn
;;     (defalias 'ccs 'clojure-cheatsheet)))


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

  ;; Generate tags for all *.clj files
  ;; (defun cnb/create-clj-tags (dir-name)
  ;;   "Create tags file."
  ;;   (interactive "Directory: ")
  ;;   (shell-command
  ;;    (format "ctags --langdef=Clojure --langmap=Clojure:.clj --regex-Clojure='/[ \t\(]*def[a-z]* \([a-z!-]+\)/\1/'  --regex-Clojure='/[ \t\(]*ns \([a-z.]+\)/\1/' -f %s/TAGS -e -R %s" dir-name (directory-file-name dir-name))))


;; (defun cider-ns-refresh ()
;;   (interactive)
;;   (cider-interactive-eval "(require 'clojure.tools.namespace.repl)")
;;   (cider-interactive-eval "(use 'clojure.repl)")
;;   (cider-interactive-eval "(clojure.tools.namespace.repl/refresh)"))

;; (define-key clojure-mode-map (kbd "M-r") 'cider-ns-refresh))


(provide 'cnb-lisp)
