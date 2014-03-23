(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; LISP

(setq lisp-modes '(common-lisp-mode
                   clojure-mode
                   emacs-lisp-mode
                   lisp-mode
                   scheme-mode))

(defun cnb-imenu-lisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(dolist (mode lisp-modes)
  (add-hook (intern (format "%s-hook" mode)) 'cnb-imenu-lisp-sections))

(when (require 'rainbow-delimiters nil t)
  (dolist (mode lisp-modes)
    (add-hook (intern (format "%s-hook" mode)) 'rainbow-delimiters-mode))

  ;; I can't see the default colors.
  (require 'cl-lib)
  (require 'color)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 30)))

  ;; Make unmatched parens stand out.
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground 'unspecified
                      :inherit 'error
                      :strike-through t))

;;;; CIDER

(eval-after-load 'cider-mode
  '(progn
     (require 'cider-eldoc)
     (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
     (add-hook 'cider-repl-mode-hook 'subword-mode)

     (setq cider-repl-history-file "~/.cider-repl-history")
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
