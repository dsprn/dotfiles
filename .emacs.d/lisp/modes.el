;; ********** modes.el
;; ALL MODES RELATED CONFIGS

;; dired
(require 'dired)
(define-key dired-mode-map "-" 'dired-up-directory)

;; vi keybindings mode
(evil-mode)
