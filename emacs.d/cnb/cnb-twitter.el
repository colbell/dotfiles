(message (concat "[CNB] - Loading [" load-file-name "]"))

(when (require 'twittering-mode nil t)
  (setq twittering-use-master-password t)
  (setq twittering-icon-mode t)                ; Show icons
  (setq twittering-timer-interval 300)         ; Update your timeline each 300 seconds (5 minutes)
  (setq twittering-url-show-status nil))       ; Keeps the echo area from showing all the http processes

(provide 'cnb-twitter)
