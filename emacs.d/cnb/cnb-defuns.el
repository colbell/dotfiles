(message (concat "[CNB] - Loading [" load-file-name "]"))

;; Found somewhere on the Internet
;; (defun edit-current-buffer-as-root ()
;;   (interactive)
;;   (let ((bfn buffer-file-name))
;;     (kill-buffer)
;;     (find-file (concatenate 'string "/sudo:root@localhost:" bfn))))


;; http://curiousprogrammer.wordpress.com/2009/04/02/ibuffer/
(defun ibuffer-ediff-marked-buffers ()
  "ediff 2 marked buffers"
  (interactive)
  (let* ((marked-buffers (ibuffer-get-marked-buffers))
         (len (length marked-buffers)))
    (unless (= 2 len)
      (error (format "%s buffer%s been marked (needs to be 2)"
                     len (if (= len 1) " has" "s have"))))
    (ediff-buffers (car marked-buffers) (cadr marked-buffers))))





;; From http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
(defun cnb/narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, subtree, or defun, whichever applies
first.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode) (org-narrow-to-subtree))
        (t (narrow-to-defun))))



(defun cnb/open-external()
  "Open file associated with current buffer or files marked in dired buffer
in native application through xdg-open"
  (interactive)
  (let (my_files)
    (if (string-equal major-mode "dired-mode")
        (setq my_files (dired-get-marked-files))
      (setq my_files (list (buffer-file-name))))

    (when my_files
      (dolist (fn my_files)
        (start-process "" nil "xdg-open" fn)))))

(provide 'cnb-defuns)
