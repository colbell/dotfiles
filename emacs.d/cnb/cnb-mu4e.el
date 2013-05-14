(when (require 'mu4e nil t)
  (if (system-is-tickit)
      (progn
        (setq mu4e-maildir "~/Maildir/tickit")
        (setq user-mail-address "cbell@tickitsystems.com.au")
        (setq user-full-name  "Colin Bell")
        (setq mu4e-user-mail-address-regexp "col@baibell\.org\\|cbell@tickitsystems.com.au")
        (setq message-signature
              (concat
               "Colin Bell\n"
               "Chief Technology Officer\n"
               "Tickit Systems Pty. Ltd.\n"
               "Suite 201 10-12 Clarke St\n"
               "(PO Box 916)\n"
               "Crows Nest NSW 2065\n"
               "D: (02) 9467 8833 T: (02) 9467 8800 M: 04039 16468 F: (02) 9467 8889\n"
               "www.tickitsystems.com.au\n"
               "www.tickitondemand.com.au\n"
               "Award winning Risk, Compliance, Incident & Audit Software\n"
               ))
        (add-to-list 'mu4e-bookmarks
                     '("maildir:/IN.jira AND flag:unread"  "Unread JIRAs"  ?j))
        (add-to-list 'mu4e-bookmarks
                     '("maildir:/IN.jira AND flag:unread AND subject:TODTASKS"  "Unread JIRA Tasks"  ?i))

))

  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
  (setq mu4e-trash-folder  "/[Gmail].Trash")

  (setq mu4e-headers-fields
        '(
          (:date . 25)
          (:flags . 6)
          (:size . 6)
          (:from-or-to . 22)
          (:subject . nil)))

  (setq mu4e-use-fancy-chars t)
  (setq mu4e-headers-passed-mark '("P" . "⇉"))
  (setq mu4e-headers-replied-mark '("R" . "↵"))
  (setq mu4e-headers-seen-mark '("S" . "-"))
  (setq mu4e-headers-unread-mark '("u" . "✉"))

  (setq mu4e-view-fields '(:from :to :cc :subject :flags :date :maildir :attachments :signature))

  (setq mu4e-headers-leave-behavior 'apply)

  (setq mu4e-headers-date-format "%d/%b/%Y %H:%M" )

  ;;(setq mu4e-html2text-command "html2text -utf8 -width 72")
  (setq mu4e-html2text-command "w3m -dump -T text/html")

  (setq mu4e-view-prefer-html nil)

  (setq mu4e-attachment-dir  "~/Downloads")

  (add-to-list 'mu4e-view-actions
               '("ViewInBrowser" . mu4e-action-view-in-browser) t)

  (setq mu4e-view-show-images t)
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  (setq mu4e-headers-skip-duplicates t)

  ;; Don't save message to Sent Messages, Gmail/IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)

  (setq mu4e-maildir-shortcuts
        '( ("/INBOX"               . ?i)
           ("/IN.jira"             . ?j)
           ("/[Gmail].Sent Mail"   . ?s)
           ("/[Gmail].Trash"       . ?t)
           ("/[Gmail].All Mail"    . ?a)))

  ;; alternatively, for emacs-24 you can use:
  ;;(setq message-send-mail-function 'smtpmail-send-it
  ;;     smtpmail-stream-type 'starttls
  ;;     smtpmail-default-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-service 587)

  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)
  )

(provide 'cnb-mu4e)
