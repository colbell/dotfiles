(setq cnb-vue-mode-packages
      '(edit-indirect vue-mode))

(setq cnb-vue-mode-excluded-packages '())

(defun cnb-vue-mode/init-edit-indirect ()
  ;; vue-mode is the only mode using edit-indirect. This should probably be
  ;; moved to the spacemacs-base layer if more layers start requiring
  ;; edit-indirect
  (use-package edit-indirect
    :defer t
    :init
    (spacemacs/set-leader-keys-for-minor-mode 'edit-indirect--overlay
      dotspacemacs-major-mode-leader-key 'edit-indirect-commit
      "c" 'edit-indirect-commit
      "a" 'edit-indirect-abort
      "k" 'edit-indirect-abort)))

(defun cnb-vue-mode/init-vue-mode ()
  "Initialize my package"
  (use-package vue-mode)
  :defer t
  :init
  (setq mmm-submode-decoration-level 2)
  (spacemacs/set-leader-keys-for-major-mode 'vue-mode
    "'" 'vue-mode-edit-indirect-at-point))
