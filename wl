;; mode:-*-emacs-lisp-*-

(setq mail-self-blind t)

(setq wl-summary-showto-folder-regexp ".*")
(setq wl-summary-from-function 'wl-summary-default-from)

;; Allow 6 digit msg nbrs.
(setq wl-summary-number-column-alist
      (append '(("^%inbox$" . 6))
              wl-summary-number-column-alist))

(setq wl-message-ignored-field-list '("^.*:"))
(setq wl-message-visible-field-list
      '("^\\(To\\|Cc\\):"
        "^Subject:"
        "^\\(From\\|Reply-To\\):"
        "^Organization:"
        "^Message-Id:"
        "^\\(Posted\\|Date\\):"
        "^List-ID:"
        "^\\(X-Mailer\\|user-agent\\|x-agent\\)"
        "^(\\(Priority\\|Importance\\):"
        "^x-editor"
        "^x-operating-system"
        ))
(setq wl-message-sort-field-list
      '("^From"
        "^Reply-To"
        "^Organization:"
        "^X-Attribution:"
        "^Subject"
        "^Date"
        "^To"
        "^Cc"))
