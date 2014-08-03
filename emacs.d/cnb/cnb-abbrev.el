(message (concat "[CNB] - Loading [" load-file-name "]"))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs 'silently)

(if (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))

;;(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))
(setq-default abbrev-mode t)

(defun cnb-ispell-word-then-abbrev (p)
  "Call `ispell-word'. Then create an abbrev for the correction made.
   With prefix P, create local abbrev. Otherwise it will be global."
  (interactive "P")
  (let ((bef (downcase (or (thing-at-point 'word) ""))) aft)
    ;; Hide the prefix arg from ispell-word
    (let ((current-prefix-arg nil))
      (call-interactively 'ispell-word))
    (setq aft (downcase (or (thing-at-point 'word) "")))
    (unless (string= aft bef)
      (message "\"%s\" now expands to \"%s\" %sally"
               bef aft (if p "loc" "glob"))
      (define-abbrev
        (if p global-abbrev-table local-abbrev-table)
        bef aft))))

(global-set-key "\C-oi" 'cnb-ispell-word-then-abbrev)

(provide 'cnb-abbrev)
