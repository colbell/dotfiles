(message (concat "[CNB] - Loading [" load-file-name "]"))

;; (when (file-readable-p "/usr/local/share/emacs/site-lisp/mu4e")
;;   (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e"))

(when (require 'mu4e nil t)

  (setq mu4e-use-fancy-chars t)
  (setq mu4e-headers-passed-mark '("P" . "⇉"))
  (setq mu4e-headers-replied-mark '("R" . "↵"))
  (setq mu4e-headers-seen-mark '("S" . "-"))
  (setq mu4e-headers-unread-mark '("u" . "✉"))
  (setq mu4e-user-mail-address-regexp "col@baibell\.org\\|colin@kwelasolutions.com")

  (setq mu4e-view-fields '(:from :to :cc :subject :flags :date :maildir :attachments :signature))

  (setq mu4e-headers-leave-behavior 'apply)

  (setq mu4e-headers-date-format "%d%b%Y %H:%M" )

  (setq mu4e-msg2pdf "/usr/bin/msg2pdf")

  ;;(setq mu4e-html2text-command "html2text -utf8 -width 72")
  (setq mu4e-html2text-command "w3m -dump -T text/html")

  (setq mu4e-view-prefer-html nil)

  (setq mu4e-attachment-dir  "~/Downloads")

  (setq user-mail-address "col@baibell.org")

  (setq mu4e-get-mail-command nil)
  ;;(setq mu4e-get-mail-command "offlineimap")
  (setq mu4e-update-interval 1200)

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
  (add-to-list 'mu4e-bookmarks
               '("date:1h..now"  "last hour"  ?h))

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
    (mu4e-maildirs-extension))

  (setq mu4e-drafts-folder "/home/[Gmail].Drafts")
  (setq mu4e-sent-folder   "/home/[Gmail].Sent\  Mail")
  (setq mu4e-trash-folder  "/home/[Gmail].Trash")

  (setq mu4e-maildir-shortcuts
        '( ("/home/INBOX"               . ?i)
           ("/home/[Gmail].Sent\  Mail" . ?s)
           ("/home/[Gmail].Trash"       . ?t)
           ("/home/[Gmail].All Mail"    . ?a)))

  ;; Don't save message to Sent Messages, Gmail/IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)

  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)

  (setq mail-user-agent 'mu4e-user-agent)

  (setq cnb/mu4e-account-alist
        '(("home"
           (user-mail-address  "col@baibell.org")
           (mu4e-drafts-folder "/home/[Gmail].Drafts")
           (mu4e-sent-folder   "/home/[Gmail].Sent\  Mail")
           (mu4e-trash-folder  "/home/[Gmail].Trash"))
          ("kwela"
           (user-mail-address  "colin@kwelasolutions.com")
           (mu4e-drafts-folder "/kwela/[Gmail].Drafts")
           (mu4e-sent-folder   "/kwela/[Gmail].Sent\  Mail")
           (mu4e-trash-folder  "/kwela/[Gmail].Trash"))))

  (defun cnb/mu4e-set-account ()
    "Set the mu4e account for composing a message."
    (let* ((account
            (if mu4e-compose-parent-message
                (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                  (string-match "/\\(.*?\\)/" maildir)
                  (match-string 1 maildir))
              (completing-read (format "Compose with account: (%s) "
                                       (mapconcat #'(lambda (var) (car var)) cnb/mu4e-account-alist "/"))
                               (mapcar #'(lambda (var) (car var)) cnb/mu4e-account-alist)
                               nil t nil nil (caar cnb/mu4e-account-alist))))
           (account-vars (cdr (assoc account cnb/mu4e-account-alist))))
      (if account-vars
          (mapc #'(lambda (var)
                    (set (car var) (cadr var)))
                account-vars)
        (error "No email account found"))))

  (add-hook 'mu4e-compose-pre-hook 'cnb/mu4e-set-account))

(provide 'cnb-mu4e)
