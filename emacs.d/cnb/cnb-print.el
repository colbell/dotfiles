(message (concat "[CNB] - Loading [" load-file-name "]"))

(require 'printing)
(pr-update-menus t)

(setenv "CUPS_SERVER" "localhost")
(require 'cups nil t)

(setq ps-printer-name t)

(defun cnb-print-to-pdf ()
  "Print the current buffer to a PDF"
  (interactive)
  (let ((ps-file (concat (buffer-name) ".ps"))
        (pdf-file (concat (buffer-name) ".pdf")))
    (ps-spool-buffer-with-faces)
    (switch-to-buffer "*PostScript*")
    (write-file ps-file)
    (kill-buffer ps-file)
    (shell-command
     (concat "ps2pdf14 " ps-file " " pdf-file))
    (delete-file ps-file)
    (find-file pdf-file)
    (message (concat "PDF Saved to: " (buffer-name) ".pdf"))))

(provide 'cnb-print)
