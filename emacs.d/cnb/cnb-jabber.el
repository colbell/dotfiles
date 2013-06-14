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
                              ))


  (setq jabber-chat-buffer-show-avatar nil
        jabber-chat-foreign-prompt-format "> "
        jabber-chat-local-prompt-format "> "
        jabber-chat-system-prompt-format "*** "
        jabber-chat-time-format "%H:%M"
        jabber-default-show ""
        jabber-groupchat-prompt-format "%n> "
        jabber-muc-private-foreign-prompt-format "%g/%n> ")

  (setq jabber-backlog-days 3.0
        jabber-roster-line-format "%c %-25n %u %-8s"
        jabber-roster-show-title nil
        jabber-show-resources nil
        jabber-show-offline-contacts nil)

  (setq jabber-roster-subscription-display
        '(("none" . " ")
         ("from" . "←")
         ("to" . "→")
         ("both" . "⇄")))


  (set-face-foreground 'jabber-chat-prompt-foreign "red")
  (set-face-foreground 'jabber-chat-prompt-local "blue")
  (set-face-foreground 'jabber-chat-prompt-system "dark green")
  (set-face-bold-p     'jabber-chat-prompt-system t)
  (set-face-foreground 'jabber-roster-user-away "orange")
  (set-face-foreground 'jabber-roster-user-chatty "green")
  (set-face-foreground 'jabber-roster-user-online "dark green")

  ;; Stop msgs in the echo area from clobbering the mini buffer
  (define-jabber-alert echo "Show a message in the echo area"
    (lambda (msg)
      (unless (minibuffer-prompt)
        (message "%s" msg))))

  (add-hook 'jabber-chat-mode-hook 'goto-address))

(provide 'cnb-jabber)
