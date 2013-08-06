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
                       ;;ace-jump-buffer
                       auctex auto-complete auto-dim-other-buffers
                       autopair bm browse-kill-ring butler
                       coffee-mode crontab-mode csv-mode cups
                       deft diminish dired-details  drag-stuff
                       edit-server edit-server-htmlize
                       ;;etags-select
                       esup expand-region
                       feature-mode
                       ;;find-file-in-project
                       find-file-in-repository findr
                       flymake flymake-coffee flymake-cursor flymake-haml flymake-ruby flymake-sass
                       ;;furl
                       git-gutter-fringe git-messenger
                       go-mode goto-chg
                       haml-mode handlebars-mode haskell-mode httpcode
                       ;;helm helm-git helm-c-yasnippet
                       ibuffer-vc icicles
                       idle-highlight
                       inf-ruby inflections jabber jump
                       key-chord
                       less-css-mode lua-mode magit markdown-mode mo-git-blame
                       muttrc-mode
                       ;;powerline
                       ;;mode-compile
                       php-mode puppet-mode
                       rainbow-delimiters rainbow-mode rbenv rhtml-mode
                       rinari robe rspec-mode rubocop
                       ruby-compilation ruby-block ruby-end ruby-mode ruby-refactor
                       rvm sass-mode
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
