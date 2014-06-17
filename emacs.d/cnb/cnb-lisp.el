(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; LISP

(when (fboundp 'key-chord-define)
  (key-chord-define lisp-mode-shared-map "qv" 'eval-region)
  (key-chord-define lisp-mode-shared-map "qb" 'eval-buffer))

(defun cnb-imenu-lisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(setq lisp-modes '(common-lisp-mode
                   clojure-mode
                   emacs-lisp-mode
                   lisp-interaction-mode
                   lisp-mode
                   scheme-mode))

(dolist (mode lisp-modes)
  (add-hook (intern (format "%s-hook" mode)) 'cnb-imenu-lisp-sections))


;;;; CLOJURE
(require 'clojure-mode-extra-font-locking nil t)


;;;; CIDER
(require 'cider nil t)
(eval-after-load 'cider-mode
  '(progn
     (setq nrepl-log-messages t)
     (require 'cider-eldoc)
     (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
     (add-hook 'cider-repl-mode-hook 'subword-mode)
     (setq nrepl-hide-special-buffers t)
     (setq cider-repl-history-file "~/.emacs.d/cider-repl-history")
     (setq cider-show-error-buffer t)
     (setq cider-repl-history-size 1000)))


;;;; SLIME

;;==============
;; Slime
;;==============
;; (setq inferior-lisp-program "clisp")
;; ;;(add-to-list 'load-path "~/.slime")
;; (when (require 'slime nil t)
;;   (slime-setup))

(provide 'cnb-lisp)
