;; mode:-*-emacs-lisp-*-

;;  make sure we can see the [Gmail email folders.
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")

;;(require 'pgg)   ;; encryption
;;(require 'nnir)  ;; IMAP searaching

(setq gnus-extra-headers '(To Cc Newsgroups List-ID X-BeenThere))
;;(setq nnmail-extra-headers '(To Cc Newsgroups List-ID X-BeenThere))

;;;;(setq gnus-treat-fill-long-lines t)

;; Performance
;;;;(setq gnus-read-active-file nil)

(setq gnus-select-method `(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnir-search-engine imap)))

(setq gnus-secondary-select-methods '((nnmaildir "Local Mail"
                                      (directory "~/.nnmaildir/"))))
;;(setq mail-sources '((maildir :path "~/Maildir/" :subdirs ("cur" "new"))))
;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)


(setq gnus-summary-line-format "%U%R%1{ %}%2{%-10&user-date;%} %4k %1{ %}%0{%-24,24n%}%1{ %} %B%s\n"
      gnus-show-threads t
      gnus-thread-hide-subtree t)
;; ;; gnus-thread-sort-functions '((not gnus-thread-sort-by-number) (not gnus-thread-sort-by-date))
;; ;; gnus-article-sort-functions '((not gnus-article-sort-by-number) (not gnus-article-sort-by-date)))

(setq  gnus-treat-hide-citation t
       gnus-cited-lines-visible '(3 . 6))


(setq gnus-fetch-old-headers 'some)

(setq-default  gnus-user-date-format-alist '((t . "%d/%m/%Y %H:%M"))
               gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
               gnus-thread-sort-functions '(gnus-thread-sort-by-date))

(setq gnus-buttonized-mime-types
      '("multipart/alternative" "multipart/signed"))


;; ;; (if window-system
;; ;;     (setq gnus-sum-thread-tree-indent "  "
;; ;;           gnus-sum-thread-tree-root "● "
;; ;;           gnus-sum-thread-tree-false-root "◯ "
;; ;;           gnus-sum-thread-tree-single-indent "◎ "
;; ;;           gnus-sum-thread-tree-vertical        "│"
;; ;;           gnus-sum-thread-tree-leaf-with-other "├─► "
;; ;;           gnus-sum-thread-tree-single-leaf     "╰─► ")
;; ;;   (setq gnus-sum-thread-tree-indent "  "
;; ;;         gnus-sum-thread-tree-root "* "
;; ;;         gnus-sum-thread-tree-false-root "O "
;; ;;         gnus-sum-thread-tree-single-indent "* "
;; ;;         gnus-sum-thread-tree-vertical        "|"
;; ;;         gnus-sum-thread-tree-leaf-with-other "|-> "
;; ;;         gnus-sum-thread-tree-single-leaf     "\-> "))

(setq gnus-summary-make-false-root 'dummy)
(setq gnus-summary-make-false-root-always nil)


;; http://www.emacswiki.org/emacs/TomRauchenwald
(copy-face 'font-lock-variable-name-face 'gnus-face-6)
(setq gnus-face-6 'gnus-face-6)
(copy-face 'font-lock-constant-face 'gnus-face-7)
(setq gnus-face-7 'gnus-face-7)
(copy-face 'gnus-face-7 'gnus-summary-normal-unread)
(copy-face 'font-lock-constant-face 'gnus-face-8)
(set-face-foreground 'gnus-face-8 "gray50")
(setq gnus-face-8 'gnus-face-8)
(copy-face 'font-lock-constant-face 'gnus-face-9)
(set-face-foreground 'gnus-face-9 "gray70")
(setq gnus-face-9 'gnus-face-9)
(setq gnus-summary-make-false-root 'dummy)
(setq gnus-summary-make-false-root-always nil)


(defun oxy-unicode-threads ()
  (interactive)
  (setq gnus-summary-dummy-line-format "    %8{│%}   %(%8{│%}                       %7{│%}%) %6{□%}  %S\n"
        gnus-summary-line-format "%8{%4k│%}%9{%U%R%z%}%8{│%}%*%(%-23,23f%)%7{│%} %6{%B%} %s\n"
        gnus-sum-thread-tree-indent " "
        gnus-sum-thread-tree-root "■ "
        gnus-sum-thread-tree-false-root "□ "
        gnus-sum-thread-tree-single-indent "▣ "
        gnus-sum-thread-tree-leaf-with-other "├─▶ "
        gnus-sum-thread-tree-vertical "│"
        gnus-sum-thread-tree-single-leaf "└─▶ "))

(defun oxy-unicode-threads-heavy ()
  (interactive)
  (setq gnus-summary-line-format "%8{%4k│%}%9{%U%R%z%}%8{│%}%8{%-10&user-date; | %}%*%(%-23,23f%)%7{║%} %6{%B%} %s\n"
        gnus-summary-dummy-line-format "    %8{│%}   %(%8{│%}                                          %7{║%}%) %6{┏○%}  %S\n"
        gnus-sum-thread-tree-indent " "
        gnus-sum-thread-tree-root "┏● "
        gnus-sum-thread-tree-false-root " ○ "
        gnus-sum-thread-tree-single-indent " ● "
        gnus-sum-thread-tree-leaf-with-other "┣━━❯ "
        gnus-sum-thread-tree-vertical "┃"
        gnus-sum-thread-tree-single-leaf "┗━━❯ "))

(oxy-unicode-threads-heavy)

(setq gnus-visible-headers "From:\\|Subject:\\|Date:\\|Organization:\\|To:\\|Cc:\\|Reply-To:\\|Message-Id:\\|List-ID\\|X-Mailer:\\|X-Editor\\|User-Agent:\\|X-Country"
      message-kill-buffer-on-exit t
      mm-inline-large-images t)


(if (string-equal system-name "zenix.net")
    (setq message-send-mail-function 'smtpmail-send-it
          smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
          smtpmail-auth-credentials '(("smtp.gmail.com" 587 "cbell@tickitsystems.com.au" nil))
          smtpmail-default-smtp-server "smtp.gmail.com"
          smtpmail-smtp-server "smtp.gmail.com"
          smtpmail-local-domain "tickitsystems.com"
          user-full-name "Colin Bell"
          user-mail-address "cbell@tickitsystems.com.au"
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


;; (require 'gnus-mst-show-country)
;; (add-hook 'gnus-article-prepare-hook 'gnus-article-mst-show-country)
