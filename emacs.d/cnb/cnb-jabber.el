(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'jabber nil t)
  (setq jabber-account-list '(
                              ("colin@kwelasolutions.com"
                               (:network-server . "talk.google.com")
                               (:connection-type . ssl))
                              ("col@baibell.org"
                               (:network-server . "talk.google.com")
                               (:connection-type . ssl))
                              ))


  (setq jabber-chat-buffer-show-avatar t
        jabber-chat-foreign-prompt-format "> "
        jabber-chat-local-prompt-format "> "
        jabber-chat-system-prompt-format "*** "
        jabber-chat-time-format "%H:%M"
        jabber-default-show ""
        jabber-groupchat-prompt-format "%n> "
        jabber-muc-private-foreign-prompt-format "%g/%n> ")

  (setq jabber-backlog-days 10.0
        jabber-roster-line-format "%c %-25n %u %-8s"
        jabber-roster-show-title nil
        jabber-show-resources nil
        jabber-history-enabled t
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

  ;; From Emacs wiki.
  (defun jabber-visit-history (jid)
    "Visit jabber history with JID in a new buffer.

Performs well only for small files.  Expect to wait a few seconds
for large histories.  Adapted from `jabber-chat-create-buffer'."
    (interactive (list (jabber-read-jid-completing "JID: ")))
    (let ((buffer (generate-new-buffer (format "*-jabber-history-%s-*"
                                               (jabber-jid-displayname jid)))))
      (switch-to-buffer buffer)
      (make-local-variable 'jabber-chat-ewoc)
      (setq jabber-chat-ewoc (ewoc-create #'jabber-chat-pp))
      (mapc 'jabber-chat-insert-backlog-entry
            (nreverse (jabber-history-query nil nil t t "."
                                            (jabber-history-filename jid))))
      (view-mode)))

  ;; Stop msgs in the echo area from clobbering the mini buffer
  (define-jabber-alert echo "Show a message in the echo area"
    (lambda (msg)
      (unless (minibuffer-prompt)
        (message "%s" msg))))

  (add-hook 'jabber-chat-mode-hook 'goto-address))

(provide 'cnb-jabber)
