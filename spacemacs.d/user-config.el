;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Editing%20warning][Editing warning:2]]
;;; -----------------------------------------------
;;; Do not edit this file, as it has been generated
;;; from an Orgmode file. If you do all changes will
;;; be lost when it is next generated on Emacs restart.
;;;
;;; Source: ~/.spacemacs.d/spacemacs.org
;;; -----------------------------------------------
;; Editing warning:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Me,%20Myself%20I][Me, Myself I:1]]
(setq user-mail-address "col@baibell.org")
(setq user-full-name "Colin Bell")
;; Me, Myself I:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Look%20and%20Feel][Look and Feel:1]]
(defun my-correct-symbol-bounds (pretty-alist)
  "Prepend a TAB character to each symbol in this alist,
this way compose-region called by prettify-symbols-mode
will use the correct width of the symbols
instead of the width measured by char-width."
  (mapcar (lambda (el)
            (setcdr el (string ?\t (cdr el)))
            el)
          pretty-alist))

(defun my-ligature-list (ligatures codepoint-start)
  "Create an alist of strings to replace with
codepoints starting from codepoint-start."
  (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
    (-zip-pair ligatures codepoints)))

(setq my-fira-code-ligatures
      (let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
                     "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
                     "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
                     "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
                     ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
                     "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
                     "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
                     "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
                     ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
                     "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                     "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
                     "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
                     "x" ":" "+" "+" "*")))
        (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

(defun my-set-prog-ligatures ()
  "Add ligatures for programming modes"
  (setq prettify-symbols-alist
        (append my-fira-code-ligatures prettify-symbols-alist))
  (prettify-symbols-mode))

(add-hook 'prog-mode-hook #'my-set-prog-ligatures)
;; Look and Feel:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Look%20and%20Feel][Look and Feel:3]]
(setq fill-column 120)
(add-hook 'prog-mode-hook #'fci-mode)
;; Look and Feel:3 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Look%20and%20Feel][Look and Feel:4]]
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(with-eval-after-load 'spaceline-segments
   (spaceline-toggle-minor-modes))
(setq-default display-line-numbers-width nil)
;; Look and Feel:4 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Look%20and%20Feel][Look and Feel:5]]
(mouse-avoidance-mode 'exile)
;; Look and Feel:5 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Modeline.][Modeline.:1]]
;; (setq doom-modeline-buffer-file-name-style 'relative-from-project)
;; (setq doom-modeline-icon t)
;; Modeline.:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*General][General:2]]
(setq recenter-positions '(top middle bottom))
;; General:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*General][General:4]]
(setq evil-goggles-pulse 'display-graphic-p)
(setq evil-goggles-async-duration nil)
(setq evil-goggles-blocking-duration nil)
;; General:4 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*General][General:5]]
(add-hook 'after-save-hook
          #'executable-make-buffer-file-executable-if-script-p)
;; General:5 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*General][General:6]]
(use-package persistent-scratch
  :config
  (setq persistent-scratch-save-file
        (concat(file-name-as-directory spacemacs-cache-directory)
               "persistent-scratch"))
  (persistent-scratch-setup-default))
;; General:6 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*General][General:7]]
(setq history-delete-duplicates t)
;; General:7 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Ruby][Ruby:1]]
(use-package rubocop
  :ensure t
  :defer t
  :commands rubocop-mode
  :diminish rubocop-mode)
;; Ruby:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Ruby][Ruby:2]]
(setq ruby-align-chained-calls t)
;; Ruby:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Elixir][Elixir:1]]
(setq create-lockfiles nil)
;; Elixir:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Elixir][Elixir:2]]
(setq alchemist-test-status-modeline t)
(setq alchemist-test-display-compilation-output t)
;; (setq alchemist-mix-test-default-options "--trace")
(setq flycheck-elixir-credo-strict t)
;; Elixir:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Elm][Elm:1]]
(use-package elm-mode
  :defer t
  :config
  (setq elm-format-on-save t)
  (setq elm-tags-on-save t)
  (setq elm-sort-imports-on-save t))
;; Elm:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Web%20Mode][Web Mode:1]]
(defun cnb/web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'cnb/web-mode-hook t)

(setq emmet-indentation 2)
;; Web Mode:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*CSS%20Modes][CSS Modes:1]]
(defun cnb/scss-mode-hook ()
  "Hooks for SCSS mode."
  (setq css-indent-offset 2))

(add-hook 'scss-mode-hook 'cnb/scss-mode-hook t)
;; CSS Modes:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Config%20files][Config files:1]]
(add-hook 'conf-mode-hook #'linum-mode)
;; Config files:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Dired][Dired:1]]
(setq dired-listing-switches "-alhG --group-directories-first")
;; Dired:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Dired][Dired:2]]
(diredfl-global-mode)
;; Dired:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Dired][Dired:3]]
(setq wdired-allow-to-change-permissions t)
;; Dired:3 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Org][Org:1]]
(with-eval-after-load 'org
  (require 'ob-tangle)
  (setq org-directory "~/Dropbox/org/")
  (setq org-agenda-files
        (list (concat org-directory "personal.org")
              (concat org-directory "kwela.org")
              (concat org-directory "notes.org")))
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "STARTED(n)" "|" "DONE(d!/!)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

  ;; Allow refiling to any agenda file.
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))

  (setq org-capture-templates
        '(("t" "todo" entry (file+headline (concat org-directory "personal.org") "Tasks")
           "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

  ;; Allow refile to create parent tasks with confirmation
  ;;(setq org-refile-allow-creating-parent-nodes (quote confirm))
  )
;; Org:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Text][Text:1]]
(add-hook 'text-mode-hook #'turn-on-auto-fill)
;; Text:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Text][Text:2]]
(defun cnb/setup-term-mode ()
  (evil-local-set-key 'insert (kbd "C-a") 'cnb/send-C-a)
  (evil-local-set-key 'insert (kbd "C-r") 'cnb/send-C-r))

(defun cnb/send-C-a ()
  (interactive)
  (term-send-raw-string "\C-a"))

(defun cnb/send-C-r ()
  (interactive)
  (term-send-raw-string "\C-r"))

(add-hook 'term-mode-hook #'cnb/setup-term-mode)
;; Text:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Foreman][Foreman:1]]
(evil-set-initial-state 'foreman-mode 'emacs)
;; Foreman:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Foreman][Foreman:2]]
(spacemacs/set-leader-keys "of" 'foreman)
;; Foreman:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Visual%20Bookmarks][Visual Bookmarks:1]]
(global-set-key (kbd "M-n") #'bm-next)
(global-set-key (kbd "M-p") #'bm-previous)
;; Visual Bookmarks:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Recent%20Files%20Mode][Recent Files Mode:1]]
(with-eval-after-load 'recentf
  ;; Files to ignore in recent files.
  (add-to-list 'recentf-exclude "~$")
  (add-to-list 'recentf-exclude "tmp")
  (add-to-list 'recentf-exclude "/ssh:")
  (add-to-list 'recentf-exclude "/sudo:")
  (add-to-list 'recentf-exclude "TAGS")
  (add-to-list 'recentf-exclude "/\\.git/.*\\'")
  (add-to-list 'recentf-exclude recentf-save-file)

  ;; TODO: Check if this is still the case
  ;; Because .emacs.d is a symlink to dotfiles/emacs.d a file can have two
  ;; names so we also need to ignore the one in dotfiles.
  (add-to-list 'recentf-exclude (file-truename "~/dotfiles/emacs.d/elpa"))
  (add-to-list 'recentf-exclude
               (file-truename "~/dotfiles/emacs.d/.cache/")))
;; Recent Files Mode:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Ivy/Swiper][Ivy/Swiper:1]]
(defun cnb/swiper-recenter (&rest args)
  "recenter display after swiper"
  (recenter))

(advice-add 'swiper :after #'cnb/swiper-recenter)
;; Ivy/Swiper:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Projectile][Projectile:1]]
(setq projectile-enable-caching t)
;; Projectile:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Projectile][Projectile:2]]
(spacemacs/set-leader-keys "oi" 'projectile-ibuffer)
;; Projectile:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Rainbow%20Mode][Rainbow Mode:1]]
(setq rainbow-html-colors t)
(setq rainbow-x-colors t)
(add-hook 'prog-mode-hook #'rainbow-mode)
;; Rainbow Mode:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Source%20Control][Source Control:2]]
(evil-set-initial-state 'magit-status-mode 'emacs)
;; Source Control:2 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*EditorConfig][EditorConfig:1]]
(use-package editorconfig
  :defer t
  :init (add-to-list 'auto-mode-alist '("\\.editorconfig" . conf-unix-mode)))
;; EditorConfig:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Show%20current%20function][Show current function:1]]
(which-function-mode)
;; (set-face-attribute 'which-func nil
;;                     :foreground (face-foreground 'font-lock-function-name-face))
;;
;; (setq-default header-line-format
;;               '((which-func-mode ("" which-func-format " "))))
;; Show current function:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*Time][Time:1]]
(require 'time)
(setq display-time-world-list '(("Australia/Sydney" "Sydney")
                                 ("Australia/Perth" "Perth")
                                 ("America/Los_Angeles" "Los Angeles")
                                 ("America/New_York" "New York")
                                 ("Asia/Shanghai" "China")
                                 ("Europe/Belfast" "Belfast")))
;; Time:1 ends here

;; [[file:~/dotfiles/spacemacs.d/spacemacs.org::*CLEANUP][CLEANUP:1]]
;;===============================================
;; Work around for https://github.com/syl20bnr/spacemacs/issues/10410
;;===============================================
(defun kill-minibuffer ()
  (interactive)
  (when (windowp (active-minibuffer-window))
    (evil-ex-search-exit)))
(add-hook 'mouse-leave-buffer-hook #'kill-minibuffer)

;; (setq imenu-list-auto-resize nil)

;; Let me right-click in terminal to show terminal menu.
(xterm-mouse-mode -1)

(setq-default
 sentence-end-double-space nil

 ;; Use a visible bell instead of a beep.
 visible-bell t

 ;; Always start a new tags list.
 tags-add-tables nil

 ;; When opening files follow all symbolic links.
 find-file-visit-truename t

 ;; I've got some TAGS files that are nearly 20MB in size.
 large-file-warning-threshold 20000000

 imenu-auto-rescan t


 ;;browse-url-browser-function 'browse-url-firefox
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "chromium-browser"
 )


(setq kill-ring-max 500)

(setq evil-want-fine-undo "Yes")

;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common)

;; My common mistakes.
(define-abbrev-table
  'global-abbrev-table '(("teh" "the" nil 0)
                         ("tehy" "they" nil 0)
                         ("yuo" "you" nil 0)
                         ("yuor" "your" nil 0)))
(setq-default abbrev-mode t)

;; Seems to be needed for evil to work with system clipboard
(fset 'evil-visual-update-x-selection 'ignore)
;; CLEANUP:1 ends here
