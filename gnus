;; mode:-*-emacs-lisp-*-

(setq gnus-select-method `(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  ))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)


(setq gnus-summary-line-format "%U%R%1{|%}%2{%-10&user-date;%}%1{|%}%0{%-24,24n%}%1{|%}%B%s\n"
      gnus-show-threads t
      gnus-thread-hide-subtree t
      gnus-thread-sort-functions '((not gnus-thread-sort-by-number) (not gnus-thread-sort-by-date))
      gnus-article-sort-functions '((not gnus-article-sort-by-number) (not gnus-article-sort-by-date))
      gnus-sum-thread-tree-root "* "
      gnus-sum-thread-tree-single-indent "* "
      gnus-sum-thread-tree-leaf-with-other "|-> "
      gnus-sum-thread-tree-vertical "|"
      gnus-sum-thread-tree-single-leaf "`-> ")
