(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'mu4e nil t)

  (setq mu4e-use-fancy-chars t)
  (setq mu4e-headers-passed-mark '("P" . "⇉"))
  (setq mu4e-headers-replied-mark '("R" . "↵"))
  (setq mu4e-headers-seen-mark '("S" . "-"))
  (setq mu4e-headers-unread-mark '("u" . "✉"))
  (setq mu4e-user-mail-address-regexp "col@baibell\.org\\|colin@kwelasolutions.com")

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
  (setq mu4e-view-images t)
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  (add-hook 'mu4e-view-mode-hook 'visual-line-mode)

  (setq mu4e-headers-skip-duplicates t)
  (add-to-list 'mu4e-bookmarks
               '("flag:attach"  "with attachments"  ?a))

  (setq mu4e-headers-fields
        '(
          (:date         . 25)
          (:flags        .  6)
          (:size         .  6)
          (:from-or-to   . 22)
          (:maildir      . 22)
          (:subject      . nil)))



  (setq message-kill-buffer-on-exit t)

  (when (require 'mu4e-maildirs-extension nil t)
    (mu4e-maildirs-extension)))


(defvar my-mu4e-account-alist
  '(("home"
     (user-mail-address "col@baibell.org")
     (user-full-name  "Colin Bell")
     (message-signature nil)
)
    ("kwela"
     (user-mail-address "colin@kwelasolutions.com")
     (user-full-name  "Colin Bell")
     (message-signature nil)
     )))


  (if (system-is-home)
      (progn



        (setq message-signature nil)

        (setq mu4e-maildir-shortcuts
              '( ("/INBOX"               . ?i)
                 ("/[Gmail].Sent Mail"   . ?s)
                 ("/[Gmail].Trash"       . ?t)
                 ("/[Gmail].All Mail"    . ?a)))))

  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
  (setq mu4e-trash-folder  "/[Gmail].Trash")



  ;; Don't save message to Sent Messages, Gmail/IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)

  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)

(provide 'cnb-mu4e)
