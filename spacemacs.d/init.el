;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are 'spacemacs-base'
   ;; or 'spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. '~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; dotspacemacs-configuration-layer-path
   ;; (list (expand-file-name "layers"
   ;;                         dotspacemacs-directory))

   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '((auto-completion :variables
                      auto-completion-private-snippets-directory
                      "~/.spacemacs.d/snippets/")
     ;;better-defaults
     clojure
     cnb-bm
     cnb-bug-reference
     cnb-muttrc
     cnb-personal
     cnb-shrink-whitespace
     colors
     elfeed
     emacs-lisp
     evil-cleverparens
     eyebrowse
     games
     (geolocation :variables
                  geolocation-enable-weather-forecast t)
     git
     html
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     javascript
     markdown
     (mu4e :variables
           mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (ruby :variables ruby-test-runner 'rspec
           ruby-version-manager 'rvm)
     ruby-on-rails
     (spell-checking :variables spell-checking-enable-auto-dictionary t)
     syntax-checking
     version-control
     shell-scripts
     spell-checking
     sql
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     version-control
     yaml)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in 'dotspacemacs/config'.
   dotspacemacs-additional-packages '(beacon
                                      crosshairs
                                      ;;mu4e-maildirs-extension
                                      w3m)

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(org-bullets)

   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default

   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents bookmarks projects)

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; dotspacemacs-themes '(spacemacs-light
   ;;                        spacemacs-dark)
   dotspacemacs-themes '(solarized-dark
                         solarized-light
                         ;; spacemacs-dark
                         ;; spacemacs-light
                         zenburn)


   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"

   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil

   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom

   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1.0

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'right-then-bottom

   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil

   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil

   ;; If non nil line numbers are turned on in all ‘prog-mode’ and ‘text-mode’
   ;; derivatives. If set to ‘relative’, also turns on relative line numbers.
   dotspacemacs-line-numbers 'relative

   ;; Delete whitespace while saving buffer.
   dotspacemacs-whitespace-cleanup 'changed))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'."
  ;; These have to be set prior to the theme been loaded.
  (setq solarized-distinct-fringe-background nil)
  (setq solarized-scale-org-headlines nil)
  (setq solarized-use-variable-pitch nil)
  (setq solarized-high-contrast-mode-line nil))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (setq dired-listing-switches "-alhG --group-directories-first")

  (setq ibuffer-show-empty-filter-groups nil)

  ;; From http://www.emacswiki.org/emacs-en/ToggleWindowSplit
  (defun cnb/toggle-frame-split ()
    "If the frame is split vertically, split it horizontally or vice versa.
  Assumes that the frame is only split into two. "
    (interactive)
    (unless (= (length (window-list)) 2)
      (error "Can only toggle a frame split in two"))
    (let ((split-vertically-p (window-combined-p)))
      (delete-window) ; closes current window
      (if split-vertically-p
          (split-window-horizontally)
        (split-window-vertically)) ; gives us a split with the other win twice
      (switch-to-buffer nil))) ; restore the orig  win in this part of the frame

  (define-key ctl-x-4-map "t" #'cnb/toggle-frame-split)

  (spacemacs/toggle-evil-cleverparens-on)
  (add-hook
   'after-save-hook
   #'executable-make-buffer-file-executable-if-script-p)

  (setq-default
   sentence-end-double-space t
   js2-basic-offset 2
   js-indent-level 2

   ;; Use a visible bell instead of a beep.
   visible-bell t

   ;; Always start a new tags list.
   tags-add-tables nil

   ;; When opening files follow all symbolic links.
   find-file-visit-truename t

   ;; I've got some TAGS files that are nearly 20MB in size.
   large-file-warning-threshold 20000000

   ;; Powerline config
   ;;powerline-default-separator 'arrow

   imenu-auto-rescan t

   ;;browse-url-browser-function 'browse-url-firefox
   browse-url-browser-function 'browse-url-generic
   browse-url-generic-program "chromium-browser"

   ;; C-l first position to top.
   recenter-positions '(top middle bottom))

  (add-to-list
   'display-buffer-alist
   `(,(rx bos "*rspec-compilation*" eos)
     (display-buffer-reuse-window)
     (reusable-frames . t)))

  (mouse-avoidance-mode 'exile)

  (setq calendar-location-name "Barcelona, Spain"
        calendar-latitude 41.23
        calendar-longitude 1.80)
  (setq sunshine-units 'metric)
  (setq sunshine-show-icons t)

  ;; (with-eval-after-load 'gnus
  ;;   (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
  ;;   (add-to-list 'mm-attachment-override-types '"image/.*")
  ;;   (setq gnus-visible-headers
  ;;         "^From:\\|^Reply-To\\|^Organization:\\|^To:\\|^Cc:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|^Gnus\\|^List-ID:\\|^X-Editor\\|^X-Mailer:\\|^User-Agent:\\|^X-Country:"))

  ;; (setq  gnus-treat-hide-citation t
  ;;        gnus-cited-lines-visible '(3 . 6))
  ;; (setq gnus-thread-hide-subtree t)

  ;; (setq gnus-read-newsrc-file nil) ;; Doesn't work with folders [GMail]

  ;; (setq message-kill-buffer-on-exit t
  ;;       mm-inline-large-images 'resize)

  ;; (setq mm-text-html-renderer 'w3m)
  ;; (setq gnus-inhibit-images nil)

  ;; (setq-default w3m-display-inline-images t)
  ;; (setq w3m-default-display-inline-images t)
  ;; (setq mm-inline-text-html-with-images t)

  ;; (setq gnus-buttonized-mime-types
  ;;       '("multipart/alternative" "multipart/signed"))
  ;; (setq gnus-secondary-select-methods
  ;;       '((nnimap "Mail"
  ;;                 (nnimap-address "localhost")
  ;;                 (nnimap-stream network)
  ;;                 (nnimap-authenticator login))))

  ;; (setq user-full-name "Colin Noel Bell"
  ;;       user-mail-address "col@baibell.org")
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

  (require 'org-mu4e)
  (setq org-mu4e-link-query-in-headers-mode nil)

  (setq mu4e-maildir "~/Maildir/home")

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

  ;;(mu4e-maildirs-extension)

  (use-package crosshairs
    :commands flash-crosshairs
    :bind (("<f11>" . flash-crosshairs)))

  ;; Never lose the cursor again.
  (use-package beacon
    :diminish beacon-mode
    :init
    (beacon-mode))

  ;; (use-package shrink-whitespace
  ;;   :bind (("M-SPC" . shrink-whitespace)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (packed spinner hydra bracketed-paste helm-rhythmbox git-commit clojure-mode s mu4e-maildirs-extension w3m bind-key ranger avy anzu evil eyebrowse bind-map spray evil-org evil-indent-textobject enh-ruby-mode evil-leader muttrc-mode xterm-color request theme-changer sunshine osx-location highlight rainbow-mode rainbow-identifiers tern yasnippet async magit auto-complete cider smartparens with-editor company helm helm-core magit-popup projectile package-build smex markdown-mode js2-mode haml-mode gitignore-mode git-gutter+ git-gutter flycheck elfeed bm zenburn-theme yaml-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package toc-org tagedit sql-indent spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle slim-mode shrink-whitespace shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rainbow-delimiters quelpa projectile-rails persp-mode pcre2el paradox pandoc-mode page-break-lines pacmacs ox-pandoc orgit org-repo-todo org-present org-pomodoro org-plus-contrib open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode ibuffer-projectile hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md flycheck-pos-tip flx-ido fish-mode fill-column-indicator feature-mode fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-cleverparens evil-args evil-anzu eshell-prompt-extras esh-help emmet-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies diff-hl define-word crosshairs company-web company-tern company-statistics company-quickhelp coffee-mode clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler buffer-move beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile align-cljlet aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell 2048-game)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((bug-reference-bug-regexp . "\\(?2:TWEB-[0-9]+\\)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
