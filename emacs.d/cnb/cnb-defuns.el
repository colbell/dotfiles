(message (concat "[CNB] - Loading [" load-file-name "]"))

(defun system-is-tickit()
  (interactive)
  (string-equal system-name "going-postal"))

(defun system-is-home()
  (interactive)
  (string-equal system-name "ankh-morpork"))

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


(defun move-line (&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n)
    (setq n 1))
  (let ((col (current-column)))
    (beginning-of-line)
    (next-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col)))


(defun move-line-up (n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))


(defun move-line-down (n)
  "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
  (move-line (if (null n) 1 n)))


(defun search-google ()
  "Prompt for a query in the minibuffer, launch the web browser and query google."
  (interactive)
  (let ((search (read-from-minibuffer "Google Search: ")))
    (browse-url (concat "http://www.google.com/search?q=" search))))


(defun tab-two ()
  (interactive)
  (setq tab-width 2))


(defun tab-four ()
  (interactive)
  (setq tab-width 4))


(defun tab-eight ()
  (interactive)
  (setq tab-width 8))

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

;; From http://www.emacswiki.org/emacs-en/ToggleWindowSplit
(defun cnb/toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame


;; From Steve Yegge https://sites.google.com/site/steveyegge2/my-dot-emacs-file
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive) (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
                      (t
                       (let* ((w1 (first (window-list)))
                              (w2 (second (window-list)))
                              (b1 (window-buffer w1))
                              (b2 (window-buffer w2))
                              (s1 (window-start w1))
                              (s2 (window-start w2)))
                         (set-window-buffer w1 b2)
                         (set-window-buffer w2 b1)
                         (set-window-start w1 s2)
                         (set-window-start w2 s1)))))

(defun rotate-windows ()
  "Rotate your windows" (interactive)
  (cond ((not (> (count-windows) 1)) (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))
                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))
                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))


;; (defun turn-on-auto-revert-mode ()
;;   (interactive)
;;   (auto-revert-mode 1))


;; http://www.gnu.org/software/emms/configs/de-emms.el
(defun cnb/toggle-playing ()
  (interactive)
  (if emms-player-playing-p
      (emms-pause)
    (emms-start)))


(defun cnb/add-dir ()
  (interactive)
  (call-interactively 'emms-add-directory-tree)
  (emms-playlist-mode-go))


;; Found somewhere on the Internet
(defun add-subdirs-to-load-path(parent-dir)
  "Add first level subdirectories in parent-dir to load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (concat parent-dir "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))


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
