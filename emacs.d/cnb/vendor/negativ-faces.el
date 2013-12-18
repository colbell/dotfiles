;; From https://gist.github.com/To1ne/5865848

;; negativ-faces
;; give all faces their negative color.
;;
;; Works great on the default theme:
;; * Just remove all `(load-theme xzy)' from your .emacs.d
;; * Restart emacs
;; * Run `(negativ-negative-all-faces)'
;; * To undo, run `(negativ-negative-all-faces)' again
;; based on http://www.emacswiki.org/emacs/AngryFruitSalad


;; TODO unit test
;; TODO defface hook?
;; TODO smart undo

(defvar negativ--faces '('powerline-inactive1 'powerline-inactive2 'powerline-active1 'powerline-active2)
  "List of faces that are already 'negativ'")

(defun negativ--negative-color (color)
  "Return the negative color for the given color."
  (let* ((col (color-values color))
         (neg (mapcar (lambda (c)
                        (/ (- (expt 2 16) c 1)
                           (expt 2 8)))
                      col)))
    (apply 'format "#%02x%02x%02x" neg)))

;(face-attribute 'default :foreground)
;(negativ--negative-color "#dcdccc")
;(negativ--negative-color "#010203")
;(negativ--negative-color "#0a0b0C")
;(negativ--negative-color "#102030")
;(negativ--negative-color "#405060")
;(negativ--negative-color "#4f5f6f")
;(negativ--negative-color "#708090")
;(negativ--negative-color "#a0b0c0")
;(negativ--negative-color "#d0e0f0")


;(eq (face-attribute 'hl-line :foreground) 'unspecified)

(defun negativ--negative-face (face)
  "Make the face color negative."
  (let* ((fg (face-attribute face :foreground))
         (bg (face-attribute face :background)))
    (unless (eq fg 'unspecified)
      (set-face-attribute face nil
                          :foreground (negativ--negative-color fg)))
    (unless (eq bg 'unspecified)
      (set-face-attribute face nil
                          :background (negativ--negative-color bg)))
    )
  )

;(negativ--negative-face 'font-lock-function-name-face)

(defun negativ-negative-all-faces ()
  "Turn all faces negative."
  (mapc 'negativ--negative-face (face-list)))

(defun negativ-smart-negative-all ()
  "Turn all faces negative, but skip those that are already done."
  (mapc (lambda (face)
          (unless (member face negativ--faces)
            (negativ--negative-face face)
            (add-to-list 'negativ--faces face))) ;; TODO this has to be done also by the other functions
        (face-list)))

;(negativ--negative-face 'default)
;(negativ-negative-all-faces)
(negativ-smart-negative-all)

(provide 'negativ-faces)
