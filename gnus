;;(setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
(setq gnus-select-method `(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  ))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
