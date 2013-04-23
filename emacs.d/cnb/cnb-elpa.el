;; Package manager
(require 'package)

(add-to-list 'package-archives '("Marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("Tromey" . "http://tromey.com/elpa/") t)

(package-initialize)

(defun cnb-install-packages()
  "Install packages from package-manager"
  (interactive)
  (when (not package-archive-contents)
    (package-refresh-contents))

  (setq cnb-packages '(ace-jump-mode
                       auctex auto-complete auto-dim-other-buffers
                       autopair bm browse-kill-ring coffee-mode
                       crontab-mode csv-mode deft diminish drag-stuff
                       ;;etags-select
                       expand-region
                       feature-mode 
                       ;;find-file-in-project
                       find-file-in-repository findr
                       flymake flymake-coffee flymake-cursor flymake-haml flymake-ruby flymake-sass
                       ;;furl
                       go-mode haml-mode haskell-mode
                       ;;helm helm-git helm-c-yasnippet
                       git-gutter handlebars-mode
                       ibuffer-vc icicles
                       idle-highlight
                       inf-ruby inflections jump
                       less-css-mode lua-mode magit markdown-mode
                       ;;powerline
                       ;;mode-compile
                       puppet-mode
                       rainbow-delimiters rainbow-mode rhtml-mode
                       rinari robe rspec-mode rubocop
                       ruby-compilation ruby-block ruby-end ruby-mode rvm sass-mode
                       ;;scpaste
                       scss-mode slim-mode
                       ;;shell-current-directory
                       smooth-scrolling solarized-theme
                       ;; sunrise-commander
                       switch-window
                       twittering-mode
                       undo-tree volatile-highlights
                       yaml-mode yasnippet
                       ;;yasnippet-bundle
                       w3m
                       zenburn-theme))

  (dolist (p cnb-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'cnb-elpa)
