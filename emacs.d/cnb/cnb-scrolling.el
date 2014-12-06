(message (concat "[CNB] - Loading [" load-file-name "]"))

;; (setq
;;  scroll-margin 0
;;  scroll-conservatively 100000
;;  scroll-preserve-screen-position t)

(require 'smooth-scrolling nil t)

(mouse-wheel-mode t)

(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

;;; Smooth mouse-wheel scrolling.
(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

(provide 'cnb-scrolling)
