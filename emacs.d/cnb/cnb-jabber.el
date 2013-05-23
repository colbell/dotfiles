(when (require 'jabber nil t)

  (setq jabber-account-list '(
                            ("cbell@tickitsystems.com.au"
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            ("col@baibell.org"
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            )))

(provide 'cnb-jabber)
