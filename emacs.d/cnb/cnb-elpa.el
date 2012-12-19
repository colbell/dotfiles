;; Package manager
(require 'package)

(package-initialize)

(add-to-list 'package-archives '("Marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("Tromey" . "http://tromey.com/elpa/") t)


(defun cnb-install-packages()
  "Install packages from package-manager"
  (interactive)
  (when (not package-archive-contents)
    (package-refresh-contents))

  (setq cnb-packages '(ace-jump-mode
                       auctex auto-complete
                       autopair bm browse-kill-ring coffee-mode
                       color-theme-solarized
                       crontab-mode csv-mode deft diminish drag-stuff
                       ;;etags-select
                       expand-region
                       feature-mode find-file-in-project findr
                       flymake flymake-coffee flymake-cursor flymake-haml flymake-ruby flymake-sass
                       ;;furl
                       go-mode haml-mode haskell-mode helm helm-git
                       ibuffer-vc
                       idle-highlight
                       inf-ruby inflections jump
                       less-css-mode lua-mode magit markdown-mode powerline
                       ;;mode-compile
                       rainbow-delimiters rainbow-mode
                       rinari rspec-mode ruby-compilation ruby-block ruby-end ruby-mode rvm sass-mode
                       ;;scpaste
                       scss-mode
                       ;;shell-current-directory
                       smooth-scrolling
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
