(when (require 'ace-jump-mode nil t)
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode)

  (when (require 'ace-jump-buffer nil t)
    (ace-jump-buffer-mode t)
    (setq-default ace-jump-buffer-turn-on)
    (global-set-key (kbd "C-c b") 'ace-jump-buffer)))

(provide 'cnb-ace)
