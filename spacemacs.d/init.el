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

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. '~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; better-defaults
     ;; clojure
     (auto-completion :variables
                     auto-completion-private-snippets-directory
                     "~/.spacemacs.d/snippets/")
     cnb-bm
     cnb-bug-reference
     cnb-dired-narrow
     cnb-muttrc
     cnb-shrink-whitespace
     colors
     csv
     elixir
     emacs-lisp
     evil-cleverparens
     games
     git
     gtags
     html
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     ivy
     javascript
     lua
     markdown
     nlinum
     org
     pdf-tools
     python
     react
     (ruby :variables ruby-test-runner 'rspec
           ruby-version-manager 'rvm)
     ruby-on-rails
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-enable-smart-eshell t)
     (spell-checking :variables spell-checking-enable-auto-dictionary t)
     syntax-checking
     version-control
     shell-scripts
     spell-checking
     sql
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     themes-megapack
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     yaml)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in 'dotspacemacs/config'.
   dotspacemacs-additional-packages '(crosshairs
                                      ;; haskell-mode
                                      rubocop
                                      peep-dired
                                      persistent-scratch
                                      ;;rainbow-mode  ;; Not sure why this is no longer loaded automatically
                                      ;; kibit-helper;; Clojure static code analyzer
                                      w3m)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages and/or extensions that will not be install and loaded.
   ;; dotspacemacs-excluded-packages '(org-bullets)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 10

   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((bookmarks . 5)
                                (projects . 7)
                                (recents . 5))

   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; dotspacemacs-themes '(spacemacs-light
   ;;                        spacemacs-dark)
   dotspacemacs-themes '(
                         railscasts
                         zenburn
                         solarized-light
                         solarized-dark
                         spacemacs-light
                         spacemacs-dark)

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Inconsolata Medium"
   ;; dotspacemacs-default-font '("Fantasque Sans Mono"

   ;; Requires sudo apt install fonts-croscore
   ;; dotspacemacs-default-font '("Cousine"
   ;;                             :size 14
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; dotspacemacs-default-font '("Ubuntu Mono"
   ;;                             :size 15
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   dotspacemacs-default-font '("Source Code Pro Medium"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; dotspacemacs-default-font '("Input"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)

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

   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t

   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize t

   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'top

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

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
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

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

   ;; Delete whitespace while saving buffer.
   dotspacemacs-whitespace-cleanup 'changed))

;; dotspacemacs-auto-resume-layouts nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'."
  ;; These have to be set prior to the theme been loaded.
  (setq solarized-distinct-fringe-background nil)
  (setq solarized-scale-org-headlines nil)
  (setq solarized-use-variable-pitch nil)
  (setq solarized-high-contrast-mode-line nil)

  (setq-default git-magit-status-fullscreen t)

  ;; Allow paste into xterm etc.
  (setq select-enable-primary t))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; Remove Unnecessary Clutter
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)

  ;;==============================================
  ;; Rainbow mode
  ;;==============================================
  (setq rainbow-html-colors t)
  (setq rainbow-x-colors t)

  ;;==============================================
  ;; ivy configuration
  ;;==============================================
  ;; (set ivy-count-format "%-4d ")
  (setq ivy-count-format "") ;; Don't count candidates.

  ;;==============================================
  ;; conf-mode configuration
  ;;==============================================
  ;;(add-hook 'conf-mode-hook #'linum-mode)
  (add-hook 'conf-mode-hook 'spacemacs/run-prog-mode-hooks)

  ;;==============================================
  ;; prog-mode configuration
  ;;==============================================
  (add-hook 'prog-mode-hook #'fci-mode)      ;; Indicate fill column.
  (add-hook 'prog-mode-hook #'rainbow-mode)
  ;;(add-hook 'prog-mode-hook #'highlight-indentation-mode)

  ;;==============================================
  ;; source control configuration
  ;;==============================================
  (global-git-commit-mode t)

  ;;==============================================
  ;; Screensaver.
  ;;==============================================
  ;;(require 'zone)
  ;;(zone-when-idle 120)

  ;;==============================================
  ;; RECENTF configuration
  ;;==============================================
  (with-eval-after-load 'recentf
    ;; Files to ignore in recent files.
    (add-to-list 'recentf-exclude "~$")
    (add-to-list 'recentf-exclude "tmp")
    (add-to-list 'recentf-exclude "/ssh:")
    (add-to-list 'recentf-exclude "/sudo:")
    (add-to-list 'recentf-exclude "TAGS")
    (add-to-list 'recentf-exclude "/\\.git/.*\\'")
    (add-to-list 'recentf-exclude recentf-save-file)

    ;; Because .emacs.d is a symlink to dotfiles/emacs.d a file can have two
    ;; names so we also need to ignore the one in dotfiles.
    (add-to-list 'recentf-exclude (file-truename "~/dotfiles/emacs.d/elpa"))
    (add-to-list 'recentf-exclude
                 (file-truename "~/dotfiles/emacs.d/.cache/")))

  ;;==============================================
  ;; DIRED configuration
  ;;==============================================
  (setq dired-listing-switches "-alhG --group-directories-first")

  (add-hook 'dired-mode-hook
            (lambda () (hl-line-mode)))

  ;; Preview files in dired.
  (use-package peep-dired
    :defer t)

  (with-eval-after-load 'dired
    (evil-define-key 'normal dired-mode-map
      (kbd "P") 'peep-dired)

    (evil-define-key 'normal peep-dired-mode-map
      (kbd "<SPC>") 'peep-dired-scroll-page-down
      (kbd "C-<SPC>") 'peep-dired-scroll-page-up
      (kbd "<backspace>") 'peep-dired-scroll-page-up
      (kbd "j") 'peep-dired-next-file
      (kbd "k") 'peep-dired-prev-file)

    (add-hook 'peep-dired-hook #'evil-normalize-keymaps))

  ;;==============================================
  ;; WINUM configuration
  ;;==============================================
  ;; Enable once https://github.com/deb0ch/emacs-winum/issues/5 fixed
  ;;(setq winum-scope (quote frame-local))

  ;;==============================================
  ;; IBUFFER configuration
  ;;==============================================
  (setq ibuffer-show-empty-filter-groups nil)


  ;;==============================================
  ;; RUBY configuration
  ;;==============================================

  (use-package rubocop
    :ensure t
    :commands rubocop-mode
    :diminish rubocop-mode)

  (setq ruby-version-manager 'rvm)
  (setq ruby-align-chained-calls t)

  ;; (with-eval-after-load 'hideshow
  ;;   (add-to-list 'hs-special-modes-alist
  ;;                `(ruby-mode
  ;;                  ,(rx (or "def" "class" "module" "{" "[")) ; Block start
  ;;                  ,(rx (or "}" "]" "end"))                  ; Block end
  ;;                  ,(rx (or "#" "=begin"))                   ; Comment start
  ;;                  ruby-forward-sexp nil)))

  (defun cnb/ruby-setup ()
    (rvm-activate-corresponding-ruby)
    (superword-mode)
    (hs-minor-mode)

    ;;(spacemacs/helm-gtags-define-keys-for-mode 'ruby-mode)

    ;;(setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")
    ;; (setq imenu-generic-expression
    ;;       '(("Methods"  "^\\( *\\(def\\) +.+\\)" 1)
    ;;         ("Examples" "^\\( *\\(its?\\|specify\\|example\\|describe\\|context\\|feature\\|scenario\\) +.+\\)" 1)))

    )

  (add-hook 'ruby-mode-hook #'cnb/ruby-setup t)

  ;;==============================================
  ;; Web mode configuration
  ;;==============================================
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2))

  (add-hook 'web-mode-hook  'my-web-mode-hook t)

  ;;==============================================
  ;; SCSS Mode
  ;;==============================================
  (defun my-scss-mode-hook ()
    "Hooks for SCSS mode."
    (setq css-indent-offset 2))

  (add-hook 'scss-mode-hook  'my-scss-mode-hook t)

  ;;==============================================
  ;; CLOJURE configuration
  ;;==============================================

  ;;(setq cider-auto-select-error-buffer nil)

  ;; (use-package clojure-mode-extra-font-locking
  ;;   :config
  ;;   (require 'clojure-mode-extra-font-locking))

  ;;==============================================
  ;; ORG configuration
  ;;==============================================

  (with-eval-after-load 'org
    (require 'ob-tangle)
    (setq org-directory "~/Dropbox/org/")
    (setq org-agenda-files
          (list (concat org-directory "personal.org")
                (concat org-directory "kwela.org")
                (concat org-directory "notes.org")))
    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "STARTED(n)" "|" "DONE(d!/!)")
                  (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

    ;; Allow refiling to any agenda file.
    (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                     (org-agenda-files :maxlevel . 9))))

    (setq org-capture-templates
          '(("t" "todo" entry (file+headline (concat org-directory "personal.org") "Tasks")
             "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

    ;; Allow refile to create parent tasks with confirmation
    ;;(setq org-refile-allow-creating-parent-nodes (quote confirm))
    )

  (add-hook
   'after-save-hook
   #'executable-make-buffer-file-executable-if-script-p)

  (add-hook
   'after-init-hook (lambda ()
                      (progn
                        (spacemacs/toggle-evil-cleverparens-on))))


  (use-package crosshairs
    :commands flash-crosshairs
    :bind (("<f9>" . flash-crosshairs)))

  (add-hook 'spacemacs-buffer-mode-hook
            (lambda () (hl-line-mode)))

  (setq imenu-list-auto-resize nil)

  (use-package persistent-scratch
    :config
    (setq persistent-scratch-save-file
          (concat(file-name-as-directory spacemacs-cache-directory)
                 "persistent-scratch"))
    (persistent-scratch-setup-default))

  (setq-default
   sentence-end-double-space t
   ;; js2-basic-offset 2
   ;; js-indent-level 2

   ;; Use a visible bell instead of a beep.
   visible-bell t

   ;; Always start a new tags list.
   tags-add-tables nil

   ;; When opening files follow all symbolic links.
   find-file-visit-truename t

   ;; I've got some TAGS files that are nearly 20MB in size.
   large-file-warning-threshold 20000000

   ;; Powerline config
   ;; powerline-default-separator 'arrow

   imenu-auto-rescan t

   ;;browse-url-browser-function 'browse-url-firefox
   browse-url-browser-function 'browse-url-generic
   browse-url-generic-program "chromium-browser"

   ;; C-l first position to top.
   recenter-positions '(top middle bottom))

  (global-hl-line-mode 0)
  (setq kill-ring-max 500)
  (evil-visual-mark-mode)

  (setq evil-want-fine-undo t)

  ;; (add-to-list
  ;;  'display-buffer-alist
  ;;  `(,(rx bos "*rspec-compilation*" eos)
  ;;    (display-buffer-reuse-window)
  ;;    (reusable-frames . t)))

  ;; Seems to be needed for evil to work with system clipboard
  (fset 'evil-visual-update-x-selection 'ignore)

  (mouse-avoidance-mode 'exile))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (macrostep elisp-slime-nav auto-compile packed fuzzy company-web web-completion-data company-tern tern company-statistics company-shell company-anaconda auto-yasnippet ac-ispell auto-complete yapfify wgrep typit mmt sudoku smex smeargle shrink-whitespace rainbow-identifiers pyvenv pytest pyenv-mode py-isort pip-requirements pdf-tools tablist pacmacs dash-functional orgit org-projectile org-present org-pomodoro alert log4e gntp org-download nlinum-relative nlinum muttrc-mode mmm-mode markdown-toc markdown-mode magit-gitflow lua-mode live-py-mode ivy-hydra ibuffer-projectile hy-mode htmlize gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags flyspell-correct-ivy evil-magit magit magit-popup evil-cleverparens paredit dired-narrow dired-hacks-utils cython-mode csv-mode counsel-projectile counsel swiper ivy color-identifiers-mode anaconda-mode pythonic 2048-game bm ob-elixir zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify w3m volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restart-emacs request rbenv rainbow-mode rainbow-delimiters purple-haze-theme pug-mode projectile-rails rake inflections professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode persistent-scratch peep-dired pcre2el pastels-on-dark-theme paradox spinner origami organic-green-theme org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme org-plus-contrib noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme minitest minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint light-soap-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-flx helm-descbinds helm-css-scss helm-ag hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gandalf-theme flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck-mix flycheck-credo flycheck flx-ido flx flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode dumb-jump f dracula-theme django-theme diminish diff-hl define-word darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme crosshairs col-highlight hl-line+ vline column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clojure-mode-extra-font-locking clojure-mode clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler inf-ruby bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-highlight-symbol auto-dictionary apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist s company dash elixir-mode pkg-info epl aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async railscasts-theme))))
