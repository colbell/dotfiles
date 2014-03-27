(message (concat "[CNB] - Loading [" load-file-name "]"))

;;=======================
;; Borrowed from Emacs starter kit
;;=======================

(defvar esk-coding-hook nil
  "Hook that gets run on activation of any programming mode.")


(defun esk-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun esk-turn-on-whitespace ()
  (whitespace-mode t))

(defun esk-pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil)))))
  (font-lock-add-keywords
   nil `(("(?\\(function\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'symbol 166))
                    nil))))))

(defun esk-run-coding-hook ()
  "Enable things that are convenient across all coding buffers."
  (run-hooks 'esk-coding-hook))


;;=======================
;; Things to do when you open a coding buffer.
;;=======================
(require 'linum)
(add-hook 'esk-coding-hook 'linum-on)
;;(add-hook 'esk-coding-hook 'imenu-add-menubar-index t)
(add-hook 'esk-coding-hook 'esk-pretty-lambdas)
(add-hook 'esk-coding-hook 'esk-add-watchwords)
(add-hook 'esk-coding-hook 'hs-minor-mode)
(add-hook 'esk-coding-hook 'whitespace-mode)
(add-hook 'esk-coding-hook 'subword-mode)

(add-hook 'esk-coding-hook 'flyspell-prog-mode t)

(when (fboundp 'yas/minor-mode)
  (add-hook 'esk-coding-hook 'yas/minor-mode))


;;=======================
;; Modes to treat as coding buffers
;;=======================
(add-hook 'prog-mode-hook       'esk-run-coding-hook)

(add-hook 'cobol-mode-hook      'esk-run-coding-hook)
(add-hook 'conf-mode-hook       'esk-run-coding-hook)
(add-hook 'css-mode-hook        'esk-run-coding-hook)
(add-hook 'cucumber-mode-hook   'esk-run-coding-hook)
(add-hook 'diff-hook            'esk-run-coding-hook)
(add-hook 'enh-ruby-mode-hook   'esk-run-coding-hook)
(add-hook 'feature-mode-hook    'esk-run-coding-hook)
(add-hook 'markdown-mode-hook   'esk-run-coding-hook)
(add-hook 'rhtml-mode-hook      'esk-run-coding-hook)
(add-hook 'yaml-mode-hook       'esk-run-coding-hook)
(add-hook 'lisp-interaction-mode 'esk-run-coding-hook)

(provide 'cnb-coding-hook)
