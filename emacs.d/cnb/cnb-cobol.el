(message (concat "[CNB] - Loading [" load-file-name "]"))

;;;; COBOL

(setq auto-mode-alist
      (append
       '(("\\.cob\\'" . cobol-mode))
       auto-mode-alist))
(autoload 'cobol-mode "cobol-mode" "Major mode for Tandem COBOL files." t nil)


(provide 'cnb-cobol)
