;; Found somewhere on the Internet
(defun edit-current-buffer-as-root ()
  (interactive)
  (let ((bfn buffer-file-name))
    (kill-buffer)
    (find-file (concatenate 'string "/sudo:root@localhost:" bfn))))


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


;; From http://www.emacswiki.org/emacs-en/MiniBuffer
(defun minibuffer-quit ()
  "Quit the minibuffer command, even when the minibuffer loses focus."
  (interactive)
  (when (active-minibuffer-window)
    (save-window-excursion
      (select-window (minibuffer-window))
      (keyboard-escape-quit))))


;; From http://www.emacswiki.org/emacs-en/MiniBuffer
(defun minibuffer-refocus ()
  "Refocus the minibuffer if it is waiting for input."
  (interactive)
  (when (active-minibuffer-window)
    (message "") ;; clear the echo area, in case it overwrote the minibuffer
    (select-window (minibuffer-window))))


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
  "Rotate your windows" (interactive) (cond ((not (> (count-windows) 1)) (message "You can't rotate a single window!"))
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


(defun turn-on-auto-revert-mode ()
  (interactive)
  (auto-revert-mode 1))


;; http://www.gnu.org/software/emms/configs/de-emms.el
(defun cnb-toggle-playing ()
  (interactive)
  (if emms-player-playing-p
      (emms-pause)
    (emms-start)))


(defun cnb-add-dir ()
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


(provide 'cnb-defuns)
