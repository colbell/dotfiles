;;==============
;; Browse the kill-ring
;;==============
(when (require 'browse-kill-ring nil t)
;; If 'yank-pop-change-selection' is t, rotating the kill ring
;; also updates the selection or clipboard to the current yank,
;; just as M-w would do so with the text it copies to the kill ring.
  (setq yank-pop-change-selection t)

  (browse-kill-ring-default-keybindings)
  (setq browse-kill-ring-quit-action 'save-and-restore))


;;*==============================================
;; Undo tree visualisation
;;*==============================================
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; Keep region when undoing in region
(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
            (p (set-marker (make-marker) (point))))
        ad-do-it
        (goto-char p)
        (set-mark m)
        (set-marker p nil)
        (set-marker m nil))
    ad-do-it))


;;==============
;; If no current selection then let C-W and M-W operate on the current
;; line. http://www.emacswiki.org/emacs/SlickCopy
;;==============
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))


(provide 'cnb-undo)
