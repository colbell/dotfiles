;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
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

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (auto-completion :variables
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
                      ;; auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-help-tooltip t)
     (bm :variables
         bm-highlight-style 'bm-highlight-only-fringe)
     cnb-beg-end
     cnb-bug-reference
     cnb-dired-narrow
     cnb-shrink-whitespace
     coffeescript
     colors
     copy-as-format
     csv
     (dash :variables
           helm-dash-docset-newpath "~/.local/share/Zeal/Zeal/docsets")
     elixir
     elm
     emacs-lisp
     epub
     ;; evil-cleverparens
     git
     haskell
     html
     ibuffer
     imenu-list
     (ivy :variables
          ivy-enable-advanced-buffer-information t
          ivy-use-virtual-buffers t)
     (javascript :variables
                 js2-basic-offset 2
                 js-indent-level 2
                 js2-highlight-level 3
                 js2-strict-missing-semi-warning nil)
     json
     lsp
     markdown
     org
     pdf
     phoenix
     prettier
     python
     react
     (ruby :variables
           ruby-test-runner 'rspec)
           ;; ruby-version-manager 'rvm)
     ruby-on-rails
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-height 30
            shell-default-position 'bottom
            ;; shell-default-term-shell "/bin/zsh"
            shell-enable-smart-eshell t)
     shell-scripts
     (spell-checking :variables
                     spell-checking-enable-auto-dictionary nil
                     ispell-dictionary "australian")
     sql
     (syntax-checking :variables syntax-checking-enable-tooltips t)
     tern
     themes-megapack
     (treemacs :variables
               treemacs-use-follow-mode t
               treemacs-use-filewatch-mode t)
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     vimscript
     xclipboard
     yaml)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ;; Extra font lock rules for dired.
                                      diredfl

                                      ;; Loaded by std spacemacs
                                      ;; editorconfig

                                      graphql-mode

                                      magit-todos

                                      peep-dired
                                      persistent-scratch

                                      ;; vue-mode
                                      ;; lsp-vue
                                      company-lsp
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only)

  ;; Conditionally load certain layers.
  ;; (when (file-directory-p "/usr/share/emacs/site-lisp/mu4e/")
  ;;   (setq dotspacemacs-configuration-layers
  ;;         (append dotspacemacs-configuration-layers
  ;;                 '((mu4e :variables
  ;;                         mu4e-use-maildirs-extension t
 ;;                         mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e/")))))
  )

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(vim :variables
                                    vim-style-visual-feedback t
                                    vim-style-remap-Y-to-y$ t
                                    vim-style-retain-visual-state-on-shift t
                                    vim-style-visual-line-move-text nil
                                    vim-style-ex-substitute-global nil)

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-one
                         doom-one-light
                         tsdh-dark
                         tsdh-light
                         flatland
                         leuven
                         spacemacs-dark
                         spacemacs-light
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S %b"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; These have to be set prior to the theme been loaded.
  (setq solarized-distinct-fringe-background nil)
  (setq solarized-scale-org-headlines nil)
  (setq solarized-use-variable-pitch nil)
  (setq solarized-high-contrast-mode-line nil)

  (setq exec-path-from-shell-check-startup-files nil)

  ;;==============================================
  ;; source control configuration
  ;;==============================================
  ;; (global-git-commit-mode t)
  (setq-default git-magit-status-fullscreen t)
  (setq magit-repository-directories
    '(("~/dotfiles/" . 0)
      ("~/src/"      . 1)))

  (with-eval-after-load 'magit-mode
    (magit-todos-mode))

  ;;==============================================
  ;; Keep Emacs maintained configuration separate
  ;;==============================================
  (setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
  (load custom-file)

  ;; TODO: Workaround for https://github.com/syl20bnr/spacemacs/issues/8131
  (spacemacs/set-default-font dotspacemacs-default-font)

  ;; Allow paste into xterm etc.
  (setq select-enable-primary t))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included
in the dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; Remove Unnecessary Clutter
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)
  (with-eval-after-load 'spaceline-segments
     (spaceline-toggle-minor-modes))

  ;; Spacemacs sets it too wide.
  (setq-default display-line-numbers-width nil)

  ;; Fixes problems with code reloading not working in Elixir/Phoenix.
  ;; See http://spacemacs.org/doc/FAQ.html#orgheadline18
  (setq create-lockfiles nil)


  ;;==============================================
  ;; Rainbow mode
  ;;==============================================
  (setq rainbow-html-colors t)
  (setq rainbow-x-colors t)

  ;;==============================================
  ;; Projectile configuration
  ;;==============================================
  (setq projectile-enable-caching t)
  (spacemacs/set-leader-keys "oi" 'projectile-ibuffer)

  ;;==============================================
  ;; ivy/swiper configuration
  ;;==============================================
  (defun cnb/swiper-recenter (&rest args)
    "recenter display after swiper"
    (recenter))

  (advice-add 'swiper :after #'cnb/swiper-recenter)

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
  ;; Evil Goggles.
  ;;==============================================
  (setq evil-goggles-pulse 'display-graphic-p)
  (setq evil-goggles-async-duration nil)
  (setq evil-goggles-blocking-duration nil)

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

    ;; TODO: Check if this is still the case
    ;; Because .emacs.d is a symlink to dotfiles/emacs.d a file can have two
    ;; names so we also need to ignore the one in dotfiles.
    (add-to-list 'recentf-exclude (file-truename "~/dotfiles/emacs.d/elpa"))
    (add-to-list 'recentf-exclude
                 (file-truename "~/dotfiles/emacs.d/.cache/")))

  ;;==============================================
  ;; DIRED configuration
  ;;==============================================
  (setq dired-listing-switches "-alhG --group-directories-first")

  ;; (add-hook 'dired-mode-hook
  ;;           (lambda () (hl-line-mode)))

  ;; Preview files in dired.
  (use-package peep-dired
    :defer t)

  (diredfl-global-mode)

  (with-eval-after-load 'dired
    (evil-define-key 'normal dired-mode-map
      (kbd "P") 'peep-dired)

    (evil-define-key 'normal peep-dired-mode-map
      (kbd "C-j") 'peep-dired-scroll-page-down
      (kbd "C-k") 'peep-dired-scroll-page-up
      (kbd "<backspace>") 'peep-dired-scroll-page-up
      (kbd "j") 'peep-dired-next-file
      (kbd "k") 'peep-dired-prev-file)

    (add-hook 'peep-dired-hook #'evil-normalize-keymaps))

  ;;==============================================
  ;; WINUM configuration
  ;;==============================================
  (setq winum-scope (quote frame-local))

  ;;==============================================
  ;; IBUFFER configuration
  ;;==============================================
  (setq ibuffer-show-empty-filter-groups nil)

  ;;==============================================
  ;; Modeline configuration
  ;;==============================================
  ;; (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
  (setq doom-modeline-buffer-file-name-style 'relative-from-project)
  (setq doom-modeline-icon t)

  ;;==============================================
  ;; ELM configuration
  ;;==============================================
  (use-package elm-mode
    :defer t
    :config
    (setq elm-format-on-save t)
    (setq elm-tags-on-save t)
    (setq elm-sort-imports-on-save t))

  ;;==============================================
  ;; RUBY configuration
  ;;==============================================

  (use-package rubocop
    :ensure t
    :defer t
    :commands rubocop-mode
    :diminish rubocop-mode)

  (setq ruby-version-manager 'rvm)
  (setq ruby-align-chained-calls t)

  ;; (defun cnb/ruby-setup ()
  ;;   (rvm-activate-corresponding-ruby))

  ;; (add-hook 'ruby-mode-hook #'cnb/ruby-setup t)

  ;;==============================================
  ;; Elixir configuration
  ;;==============================================
  (setq alchemist-test-status-modeline t)
  (setq alchemist-test-display-compilation-output t)
  ;; (setq alchemist-mix-test-default-options "--trace")
  (setq flycheck-elixir-credo-strict t)

  ;;==============================================
  ;; Web mode configuration
  ;;==============================================
  (defun cnb/web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2))

  (add-hook 'web-mode-hook 'cnb/web-mode-hook t)

  (setq emmet-indentation 2)

  ;;==============================================
  ;; EditorConfig configuration
  ;;==============================================
  (use-package editorconfig
    :defer t
    :init (add-to-list 'auto-mode-alist '("\\.editorconfig" . conf-unix-mode)))

  ;;==============================================
  ;; SCSS Mode
  ;;==============================================
  (defun cnb/scss-mode-hook ()
    "Hooks for SCSS mode."
    (setq css-indent-offset 2))

  (add-hook 'scss-mode-hook 'cnb/scss-mode-hook t)

  ;;==============================================
  ;; Vue configuration
  ;;==============================================
  ;; (require 'vue-mode)
  ;; (require 'lsp-mode)
  ;; (require 'lsp-vue)
  ;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
  ;; ;; (add-hook 'vue-mode-hook #'flycheck-enable)
  ;; (add-hook 'vue-mode-hook #'flycheck-mode)

  ;; (require 'vue-mode)
  ;; (add-to-list 'vue-mode-hook #'smartparens-mode)

  ;; (require 'lsp-mode)
  ;; (require 'lsp-ui)
  ;; (require 'lsp-vue)
  ;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)

  ;; (require 'company-lsp)
  ;; (push 'company-lsp company-backends)

  ;; (add-hook 'vue-mode-hook 'flycheck-mode)

  ;; (setq mmm-js-mode-exit-hook (lambda () (setq tern-mode nil)))
  ;; (setq mmm-js-mode-enter-hook (lambda () (setq tern-mode t)))

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

  ;;===============================================
  ;; Visual marks.
  ;;===============================================
  (evil-visual-mark-mode)

  ;; Workaround for https://github.com/roman/evil-visual-mark-mode/issues/7
  ;; When marks are deleted (:delmarks), evil-visual-mark-mode doesn't clear
  ;; them unless toggled (disabled/enabled).
  (advice-add #'evil-delete-marks :after
              (lambda (&rest _)
                (evil-visual-mark-render)))

  ;;===============================================
  ;; Show current function.
  ;;===============================================
  (which-function-mode)
  ;; (set-face-attribute 'which-func nil
  ;;                     :foreground (face-foreground 'font-lock-function-name-face))

  ;; (setq-default header-line-format
  ;;               '((which-func-mode ("" which-func-format " "))))

  ;;===============================================
  ;; Email client
  ;;===============================================
  ;; (with-eval-after-load 'mu4e
  ;;   (require 'mu4e-contrib)
  ;;   (setq mu4e-html2text-command 'mu4e-shr2text)
  ;;   ;; (setq mu4e-html2text-command "html2text -utf8 -width 72")
  ;;   ;; (setq mu4e-html2text-command "w3m -dump -T text/html")

  ;;   (setq user-mail-address "col@baibell.org")
  ;;   (setq user-full-name "Colin Bell")
  ;;   (setq mu4e-user-mail-address-regexp "col@baibell\.org\\|colin@kwelasolutions.com")

  ;;   (setq mu4e-maildir "~/mbsync")
  ;;   (setq mu4e-drafts-folder "/[Gmail]/Drafts")
  ;;   (setq mu4e-sent-folder "/[Gmail]/Sent Mail")
  ;;   (setq mu4e-trash-folder  "/[Gmail]/Trash")

  ;;   ;; Needed for Gmail/mbsync
  ;;   (setq mu4e-change-filenames-when-moving t)

  ;;   (setq mail-user-agent 'mu4e-user-agent)

  ;;   (setq mu4e-use-fancy-chars t)
  ;;   ;; (setq mu4e-headers-new-mark '("N" . "❗"))
  ;;   ;; (setq mu4e-headers-passed-mark '("P" . "⇉"))
  ;;   ;; (setq mu4e-headers-replied-mark '("R" . "↵"))
  ;;   ;; (setq mu4e-headers-seen-mark '("S" . "✉"))
  ;;   ;; (setq mu4e-headers-unread-mark '("u" . "📨")
  ;;   (setq mu4e-view-prefer-html nil)
  ;;   (setq mu4e-headers-skip-duplicates t)
  ;;   (setq mu4e-view-fields
  ;;         '(:from :to :cc :subject :flags :date :maildir :mailing-list :tags
  ;;                 :attachments :signature :decryption :user-agent))
  ;;   (setq mu4e-headers-fields
  ;;         '(
  ;;           (:human-date   . 20)
  ;;           (:flags        .  8)
  ;;           (:size         .  8)
  ;;           (:from-or-to   . 22)
  ;;           (:maildir      . 22)
  ;;           (:subject      . nil)))

  ;;   ;; Set format=flowed
  ;;   ;; mu4e sets up visual-line-mode and also fill (M-q) to do the right thing
  ;;   ;; each paragraph is a single long line; at sending, emacs will add the
  ;;   ;; special line continuation characters.
  ;;   (setq mu4e-compose-format-flowed t)

  ;;   (setq mu4e-headers-leave-behavior 'apply)
  ;;   (setq message-kill-buffer-on-exit t)

  ;;   (setq mu4e-headers-date-format "%d%b%y %H:%M" )

  ;;   ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
  ;;   (setq mu4e-sent-messages-behavior 'delete)

  ;;   (setq mu4e-auto-retrieve-keys t)

  ;;   ;; Hide annoying messsages.
  ;;   (setq mu4e-hide-index-messages t)

  ;;   (setq mu4e-confirm-quit t)

  ;;   (setq mu4e-msg2pdf "/usr/bin/msg2pdf")
  ;;   (setq mu4e-attachment-dir  "~/Downloads")

  ;;   (setq mu4e-view-show-images t)

  ;;   (when (fboundp 'imagemagick-register-types)
  ;;     (imagemagick-register-types))

  ;;   (setq mu4e-view-show-addresses t)

  ;;   (setq mu4e-get-mail-command "mbsync -a")

  ;;   (setq smtpmail-default-smtp-server "smtp.gmail.com")
  ;;   (setq smtpmail-smtp-server "smtp.gmail.com")
  ;;   (setq smtpmail-smtp-service 587))

  ;;===============================================
  ;; Work around for https://github.com/syl20bnr/spacemacs/issues/10410
  ;;===============================================
  (defun kill-minibuffer ()
    (interactive)
    (when (windowp (active-minibuffer-window))
      (evil-ex-search-exit)))
  (add-hook 'mouse-leave-buffer-hook #'kill-minibuffer)

  ;;===============================================
  ;; If saving a script file ensure that it is executable
  ;;===============================================
  (add-hook 'after-save-hook
            #'executable-make-buffer-file-executable-if-script-p)

  ;;===============================================
  ;; Save contents of scratch buffer on exit and restore on startup.
  ;;===============================================
  (use-package persistent-scratch
    :config
    (setq persistent-scratch-save-file
          (concat(file-name-as-directory spacemacs-cache-directory)
                 "persistent-scratch"))
    (persistent-scratch-setup-default))

  ;; (setq imenu-list-auto-resize nil)

  ;; Let me right-click in terminal to show terminal menu.
  (xterm-mouse-mode -1)

  (setq-default
   sentence-end-double-space t

   ;; Use a visible bell instead of a beep.
   visible-bell t

   ;; Always start a new tags list.
   tags-add-tables nil

   ;; When opening files follow all symbolic links.
   find-file-visit-truename t

   ;; I've got some TAGS files that are nearly 20MB in size.
   large-file-warning-threshold 20000000

   imenu-auto-rescan t

   fill-column 120

   ;;browse-url-browser-function 'browse-url-firefox
   browse-url-browser-function 'browse-url-generic
   browse-url-generic-program "chromium-browser"

   ;; C-l first position to top.
   recenter-positions '(top middle bottom))

  ;; (setq neo-theme 'nerd)

  ;; (global-hl-line-mode 0)
  (setq kill-ring-max 500)

  (setq evil-want-fine-undo "Yes")

  ;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common)

  ;; Next/Prev bookmark.
  (global-set-key (kbd "M-n") #'bm-next)
  (global-set-key (kbd "M-p") #'bm-previous)

  ;; My common mistakes.
  (define-abbrev-table
    'global-abbrev-table '(("teh" "the" nil 0)
                           ("tehy" "they" nil 0)
                           ("yuo" "you" nil 0)
                           ("yuor" "your" nil 0)))
  (setq-default abbrev-mode t)

  ;; Seems to be needed for evil to work with system clipboard
  (fset 'evil-visual-update-x-selection 'ignore)

  (mouse-avoidance-mode 'exile))
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
