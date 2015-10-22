;;; package --- My Emacs configuration

;;; Commentary:

;; My Emacs configuaration is stored in colbell.org and is
;; compiled into colbell.el via org-babel-load-file.

;;; Code:

;;(package-initialize)

;; Remove Unnecessary Clutter early to avoid momentary display. I also turn off
;; the menu-bar in .Xresources in order to stop the momentary flicker.
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(eval '(setq inhibit-startup-echo-area-message "colbell"))

(setq gc-cons-threshold 100000000)  ;; Speeds startup - approx 2 secs faster

(let ((file-name-handler-alist nil))  ;; Speeds startup - approx 1 sec faster
  ;; Initialize package manager.
  (setq package-enable-at-startup nil)
  (require 'package)

  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/")
               'APPEND)
  (package-initialize)

  ;; I use 'use-package' to tidy up my Emacs configuration.
  (unless (package-installed-p 'use-package)
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

  (eval-when-compile
    (require 'use-package))

  (setq use-package-verbose t)

  ;; use-package needs these packages to use the :bind and
  ;; :diminish options.
  (use-package diminish :ensure t)
  (require 'diminish)
  (use-package bind-key :ensure t)
  (require 'bind-key)

  ;; Use org-babel-load-file to compile colbell.org into colbell.el and
  ;; then load colbell.el. Only do this if colbell.el doesn't exist or
  ;; if colbell.org is newer than colbell.el.
  (let ((my-el-f (expand-file-name "colbell.el" user-emacs-directory))
        (my-org-f (expand-file-name "colbell.org" user-emacs-directory)))
    (if (or (not (file-exists-p my-el-f))
            (time-less-p (nth 5 (file-attributes my-el-f))
                         (nth 5 (file-attributes my-org-f))))
        (org-babel-load-file my-org-f)
      (load my-el-f))))

(provide 'init)
;;; init.el ends here
