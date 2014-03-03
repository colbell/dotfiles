(message (concat "[CNB] - Loading [" load-file-name "]"))

(eval-after-load 'cider-mode
  '(progn
     (require 'cider-eldoc)
     (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
     (add-hook 'cider-repl-mode-hook 'subword-mode)

     (setq cider-repl-history-file "~/.cider-repl-history")
     (setq cider-repl-history-size 1000)))


(provide 'cnb-clojure)
