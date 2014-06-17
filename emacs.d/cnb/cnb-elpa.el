(message (concat "[CNB] - Loading [" load-file-name "]"))

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") 'APPEND)
;;(add-to-list 'package-archives '("Marmalade" . "http://marmalade-repo.org/packages/") 'APPEND)
;;(add-to-list 'package-archives '("Tromey" . "http://tromey.com/elpa/") 'APPEND)
;;(add-to-list 'package-archives '("melpa-stable" . "http://hiddencameras.milkbox.net/packages/") 'APPEND)

(package-initialize)

(defun cnb-package-menu-hook()
  (visual-line-mode -1))

(add-hook 'paradox-menu-mode-hook
          (lambda ()
            (cnb-package-menu-hook)))

(add-hook 'package-menu-mode-hook
          (lambda ()
            (cnb-package-menu-hook)))


(defun cnb-install-packages()
  "Install packages from package-manager"
  (interactive)
  (package-refresh-contents)

  (setq cnb-packages '(;;ac-slime
                       ace-jump-mode ace-link ace-window
                       ack-and-a-half anti-zenburn-theme
                       anzu
                       auctex ;;auto-complete ;;auto-dim-other-buffers
                       autopair bm bookmark+ browse-kill-ring ;;butler
                       cider cider-decompile cider-tracing
                       ;;clojure-cheatsheet
                       clojure-mode clojure-mode-extra-font-locking
                       coffee-mode color-identifiers-mode
                       company company-cider
                       creole-mode
                       crontab-mode crosshairs csv-mode
                       deft diminish dired+
                       discover discover-my-major
                       drag-stuff
                       ;;edit-server edit-server-htmlize
                       ;;enh-ruby-mode ensime
                       ;;etags-select
                       esup expand-region
                       f  ;; Required by projectile.
                       feature-mode
                       ;;find-file-in-project
                       find-file-in-repository findr flymake flymake-coffee
                       flymake-cursor flymake-haml flymake-ruby flymake-sass
                       ;;furl
                       git-gutter-fringe
                       ;; git-messenger go-mode
                       goto-chg haml-mode handlebars-mode haskell-mode httpcode
                       helm helm-git helm-c-yasnippet helm-projectile helm-rails
                       helm-swoop ibuffer-vc ;;icicles
                       ;;idle-highlight
                       inf-ruby inflections
                       jabber jump key-chord less-css-mode lua-mode magit
                       markdown-mode mo-git-blame multiple-cursors muttrc-mode
                       ;; mu4e-maildirs-extension powerline mode-compile php-mode
                       paradox
                       puppet-mode projectile ;;projectile-rails
                       rainbow-delimiters
                       rainbow-mode rbenv rhtml-mode
                       ;; rinari
                       robe rspec-mode rubocop
                       ruby-compilation ruby-block ruby-end
                       ;;ruby-mode
                       ruby-refactor
                       rvm sass-mode sbt-mode scala-mode2
                       ;;scpaste
                       scss-mode
                       ;;shell-current-directory
                       slim-mode
                       slime
                       smartscan
                       smartparens smooth-scrolling
                       ;;solarized-theme
                       ;; sunrise-commander
                       switch-window
                       twilight-theme twittering-mode
                       ;;undo-tree
                       ;;volatile-highlights
                       web-mode
                       yaml-mode yard-mode yasnippet
                       ;;yasnippet-bundle
                       zenburn-theme
                       ))

  (dolist (p cnb-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'cnb-elpa)
