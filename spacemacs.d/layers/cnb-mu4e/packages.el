;;; packages.el --- cnb-mu4e. mu4e settings
;;
;; Copyright (c) 2015 Colin Bell
;;
;; Author: Colin Bell <col@baibell.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar cnb-mu4e-packages '())
  ;; '((mu4e :location local
  ;;         :variables mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")))

;; List of packages to exclude.
(setq cnb-mu4e-excluded-packages  '())

;;(defun cnb-mu4e/init-mu4e ()
  (with-eval-after-load 'mu4e
    (require 'mu4e-contrib)
    ;;(setq mu4e-html2text-command 'mu4e-shr2text)
    ;;(setq mu4e-html2text-command "w3m -T text/html")
    (setq mu4e-headers-skip-duplicates t)
    (setq mu4e-html2text-command "html2text -utf8 -width 72")
    ;;(setq mu4e-html2text-command "html2markdown --body-width=0")

    (add-to-list 'mu4e-view-actions
                 '("xViewXWidget" . my-mu4e-action-view-with-xwidget) t)

    (add-to-list 'mu4e-bookmarks '("flag:flagged" "Flagged messages" ?f) t)
    (add-to-list 'mu4e-bookmarks '("size:500K..500M" "Big messages" ?b) t)
    (add-to-list 'mu4e-bookmarks '("date:2d..now AND NOT flag:trashed"  "Last 2 days" ?2) t)

    (setq message-signature-file "~/.signature") ;; NOT used by mu4e
    (setq mu4e-compose-signature (with-temp-buffer
                                   (insert-file-contents "~/.signature")
                                   (buffer-string)))
    ;; (add-hook 'mu4e-view-mode-hook
    ;;           (lambda()
    ;;             ;; try to emulate some of the eww key-bindings
    ;;             (local-set-key (kbd "<tab>") 'shr-next-link)
    ;;             (local-set-key (kbd "<backtab>") 'shr-previous-link)))
    (require 'org-mu4e)
    (setq org-mu4e-link-query-in-headers-mode nil)
    ;;(setq mu4e-maildir "~/Maildir/home")
    ;;(setq mu4e-account-alist
    ;;      '(("home"
    ;;         (mu4e-maildir "~/Maildir/home"))))
    ;;(mu4e/mail-account-reset)
    )
  ;;(mu4e-maildirs-extension)


  (add-hook
   'mu4e-compose-mode-hook
   (lambda()
     (message-add-header
      (concat "X-Editor: GNU Emacs " emacs-version "\n"))
     (message-add-header
      (concat "X-Mailer: MU4e " mu4e-mu-version "\n"))))

  ;;(setq mu4e-headers-date-format "%Y-%m-%d %H:%M:%S")
  (setq mu4e-headers-date-format "%x")
  (setq mu4e-headers-fields '((:human-date . 12)
                              (:flags . 10)
                              (:mailing-list . 10)
                              (:from-or-to . 25)
                              (:subject . nil)))
  ;; (setq mu4e-view-fields '(:from :to  :cc :subject :flags :date :maildir
  ;;                                :mailing-list :tags :attachments :signature
  ;;                                :decryption :X-Editor :X-Mailer :User-Agent) )

  (setq mu4e-use-fancy-chars t)
  (setq mu4e-attachment-dir  "~/Downloads")
  (setq mu4e-view-show-addresses t)
  (setq mu4e-view-prefer-html t)

  (add-hook 'mu4e-view-mode-hook 'smiley-buffer)

  ;; Attempt to show images in messages.
  (setq mu4e-view-show-images t
        mu4e-view-image-max-width 800)  ;; use imagemagick, if available
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  (setq user-full-name "Colin Noel Bell"
        user-mail-address "col@baibell.org")
  (setq message-kill-buffer-on-exit t)

  (setq mu4e-maildir "~/Maildir/home")
  ;; (setq mu4e-account-alist
  ;;       '(("home"
  ;;          (mu4e-maildir "~/Maildir/home"))))
  ;; (mu4e/mail-account-reset)

  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
  (setq mu4e-trash-folder  "/[Gmail].Trash")

  ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)
  (setq mu4e-maildir-shortcuts
        '( ("/INBOX"               . ?i)
           ("/[Gmail].Sent Mail"   . ?s)
           ("/[Gmail].Trash"       . ?t)
           ("/[Gmail].All Mail"    . ?a)
           ("/[Gmail].Spam"        . ?p)
           ))

  (setq mail-user-agent 'mu4e-user-agent)

  ;; Make sure that the Debian package 'gnutls-bin' is installed.
  (require 'smtpmail)
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)
  ;; )
  ;;)

(defun my-mu4e-action-view-with-xwidget (msg)
  "View the body of the message inside xwidget-webkit."
  (unless (fboundp 'xwidget-webkit-browse-url)
    (mu4e-error "No xwidget support available"))
  (let* ((html (mu4e-message-field msg :body-html))
         (txt (mu4e-message-field msg :body-txt))
         (tmpfile (format "%s%x.html" temporary-file-directory (random t))))
    (unless (or html txt)
      (mu4e-error "No body part for this message"))
    (with-temp-buffer
      ;; simplistic -- but note that it's only an example...
      (insert (or html (concat "<pre>" txt "</pre>")))
      (write-file tmpfile)
      (xwidget-webkit-browse-url (concat "file://" tmpfile) t))))
