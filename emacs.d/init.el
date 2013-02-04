;; C-u 0 M-x byte-recompile-directory
;; will speed up emacs start time.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; Taken from emacs starter kit

(add-to-list 'load-path (concat dotfiles-dir "cnb"))

(setq custom-file (concat dotfiles-dir "emacs-custom.el"))
(load custom-file t)

(setq inhibit-startup-echo-area-message "colbell")

(require 'cnb) ;; main config file

;;(require 'time)
(defun cnb-init-time()
  (message (concat "Startup Time: " (emacs-init-time))))

(add-hook 'after-init-hook 'cnb-init-time)
