;;*==============================================
;; Some notes: http://doc.norang.ca/org-mode.html
;;*==============================================
;;(setq org-completion-use-ido t)
(setq org-directory "~/Ubuntu One/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(add-hook 'org-mode-hook 'turn-off-auto-fill)

(setq org-agenda-files (quote ("~/Ubuntu One/org/personal.org" "~/Ubuntu One/org/work.org")))
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "DONE"))
;; (setq org-agenda-include-diary t)
;; (setq org-agenda-include-all-todo t)
;; (setq org-log-done t)

;; (org-remember-insinuate)
;; (setq org-remember-templates
;;       '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/Ubuntu One/org/remember.org" "Tasks")
;;         ("Ideas" ?i "* %^{Title}\n  %i\n  %a" "~/Ubuntu One/org/ideas.org" "New Ideas")))

;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("STARTED" :foreground "cyan" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   ))


;;==============
;; Deft mode
;;==============
(when (require 'deft nil 'noerror)
  (setq
   deft-extension "org"
   deft-directory(concat org-directory "deft/")
   deft-text-mode 'org-mode)
  (global-set-key (kbd "<f9>") 'deft))


(provide 'cnb-org)
