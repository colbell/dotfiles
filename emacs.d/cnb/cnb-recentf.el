(require 'recentf)

(setq recentf-max-saved-items 200)
(setq recentf-exclude '("~$"))

(add-to-list 'recentf-exclude "~/.emacs.d/elpa/.*")
(add-to-list 'recentf-exclude "~/.ido.last")
(add-to-list 'recentf-exclude "~/.emacs.d/recentf")
(add-to-list 'recentf-exclude "~/.emacs.d/places")
(add-to-list 'recentf-exclude "~/.emacs.d/elpa/.*")

(setq recentf-save-file "~/.emacs.d/recentf")

(recentf-mode 1)

(provide 'cnb-recentf)
