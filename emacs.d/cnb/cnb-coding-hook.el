;;=======================
;; Borrowed from Emacs starter kit
;;=======================

(defvar esk-coding-hook nil
  "Hook that gets run on activation of any programming mode.")


(defun esk-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun esk-turn-on-hl-line-mode ()
  (when window-system (hl-line-mode t)))

;; (defun esk-turn-on-save-place-mode ()
;;   (require 'saveplace)
;;   (setq save-place t))

(defun esk-turn-on-whitespace ()
  (whitespace-mode t))

(defun esk-pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun esk-run-coding-hook ()
  "Enable things that are convenient across all coding buffers."
  (run-hooks 'esk-coding-hook))


(defun esk-semantic()
  (add-to-list 'completion-at-point-functions 'semantic-completion-at-point-function))


;;=======================
;; Things to do when you open a coding buffer.
;;=======================
(require 'linum)
(add-hook 'esk-coding-hook 'linum-on)
(add-hook 'esk-coding-hook 'esk-turn-on-hl-line-mode)
(add-hook 'esk-coding-hook 'esk-pretty-lambdas)
(add-hook 'esk-coding-hook 'esk-add-watchwords)

;;(add-hook 'esk-coding-hook 'turn-on-whitespace)
(add-hook 'esk-coding-hook 'flyspell-prog-mode t)
(add-hook 'esk-coding-hook 'esk-semantic t)

(when (fboundp 'idle-highlight)
  (add-hook 'esk-coding-hook 'idle-highlight))
(when (fboundp 'yas/minor-mode)
  (add-hook 'esk-coding-hook 'yas/minor-mode))


;;=======================
;; Modes to treat as coding buffers
;;=======================
(add-hook 'coffee-mode-hook     'esk-run-coding-hook)
(add-hook 'conf-mode-hook       'esk-run-coding-hook)
(add-hook 'css-mode-hook        'esk-run-coding-hook)
(add-hook 'cucumber-mode-hook   'esk-run-coding-hook)
(add-hook 'diff-hook            'esk-run-coding-hook)
(add-hook 'emacs-lisp-mode-hook 'esk-run-coding-hook)
(add-hook 'feature-mode-hook    'esk-run-coding-hook)
(add-hook 'haml-mode-hook       'esk-run-coding-hook)
(add-hook 'haskell-mode-hook    'esk-run-coding-hook)
(add-hook 'html-mode-hook       'esk-run-coding-hook)
(add-hook 'js-mode-hook         'esk-run-coding-hook)
(add-hook 'lua-mode-hook        'esk-run-coding-hook)
(add-hook 'muttrc-mode-hook     'esk-run-coding-hook)
(add-hook 'nxml-mode-hook       'esk-run-coding-hook)
(add-hook 'python-mode-hook     'esk-run-coding-hook)
(add-hook 'rhtml-mode-hook      'esk-run-coding-hook)
(add-hook 'ruby-mode-hook       'esk-run-coding-hook)
(add-hook 'sass-mode-hook       'esk-run-coding-hook)
(add-hook 'sh-mode-hook         'esk-run-coding-hook)
(add-hook 'yaml-mode-hook       'esk-run-coding-hook)


(provide 'cnb-coding-hook)
