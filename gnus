;; mode:-*-emacs-lisp-*-

(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")

(require 'pgg)   ;; encryption
(require 'nnir)  ;; IMAP searaching

(setq gnus-extra-headers '(To Cc Newsgroups List-ID X-BeenThere))
(setq nnmail-extra-headers '(To Cc Newsgroups List-ID X-BeenThere))

;;(setq gnus-treat-fill-long-lines t)

;; Performance
;;(setq gnus-read-active-file nil)

(setq gnus-select-method `(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnir-search-engine imap)))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)


(setq gnus-summary-line-format "%U%R%1{ %}%2{%-10&user-date;%} %4k %1{ %}%0{%-24,24n%}%1{ %}%e %B%s\n"
      gnus-show-threads t
      gnus-thread-hide-subtree t)
;; gnus-thread-sort-functions '((not gnus-thread-sort-by-number) (not gnus-thread-sort-by-date))
;; gnus-article-sort-functions '((not gnus-article-sort-by-number) (not gnus-article-sort-by-date)))

(setq  gnus-treat-hide-citation t
       gnus-cited-lines-visible '(3 . 6))

;; (setq gnus-sum-thread-tree-root "\x4912f "
;;       gnus-sum-thread-tree-single-indent "\x4912e "
;;       gnus-sum-thread-tree-leaf-with-other "\x4903c\x49020\x490fa "
;;       gnus-sum-thread-tree-vertical "\x49022"
;;       gnus-sum-thread-tree-single-leaf "\x490b0\x49020\x490fa ")
;;gnus-sum-thread-tree-root "* "
;;gnus-sum-thread-tree-single-indent "* "
;;gnus-sum-thread-tree-leaf-with-other "|-> "
;;gnus-sum-thread-tree-vertical "|"
;;gnus-sum-thread-tree-single-leaf "`-> ")

(setq gnus-fetch-old-headers 'some)

(setq-default  gnus-user-date-format-alist '((t . "%d/%m/%Y %H:%M"))
               gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
               gnus-thread-sort-functions '(gnus-thread-sort-by-date)
               gnus-sum-thread-tree-false-root ""
               gnus-sum-thread-tree-indent " "
               gnus-sum-thread-tree-leaf-with-other "├► "
               gnus-sum-thread-tree-root ""
               gnus-sum-thread-tree-single-leaf "╰► "
               gnus-sum-thread-tree-vertical "│")

(setq gnus-visible-headers "From:\\|Subject:\\|Date:\\|Organization:\\|To:\\|Cc:\\|Reply-To:\\|Message-Id:\\|List-ID\\|X-Mailer:\\|X-Editor\\|User-Agent:"
      message-kill-buffer-on-exit t
      mm-inline-large-images t)


(if (string-equal system-name "olethros")
    (setq message-send-mail-function 'smtpmail-send-it
          smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
          smtpmail-auth-credentials '(("smtp.gmail.com" 587 "cbell@tickitsystems.com.au" nil))
          smtpmail-default-smtp-server "smtp.gmail.com"
          smtpmail-smtp-server "smtp.gmail.com"
          smtpmail-local-domain "tickitsystems.com"
          user-full-name "Colin Bell"
          user-mail-address "cbell@tickitsystems.com"
          smtpmail-smtp-service 587)
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
        smtpmail-auth-credentials '(("smtp.gmail.com" 587 "col@baibell.org" nil))
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-local-domain "baibell.org"
        user-full-name "Colin Bell"
        user-mail-address "col@baibell.org"
        smtpmail-smtp-service 587))
