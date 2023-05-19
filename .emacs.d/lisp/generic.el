;; ********** generic.el
;; CONFIGURE SOME DIRED AND OTHER MODES SETTINGS, PLUS SOME STARTING STUFF

;; variables
(setq initial-buffer-choice t)		; select scratch buffer at start
(setq ring-bell-function 'ignore)	; silence bell
(setq backup-by-copying t)
(setq column-number-mode t)

;; modes specific settings
(ido-mode t)
(global-visual-line-mode t)
(show-paren-mode t)
(electric-pair-mode t)

;; dired specific settings
(setq-default dired-listing-switches "-lah --group-directories-first")
(setq-default dired-recursive-copies 'always)
(setq-default dired-recursive-deletes 'always)
(display-time-mode nil)

;; text specific settings
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)	; do not use tabs when indenting
(prefer-coding-system 'utf-8)
(delete-selection-mode 1)           ; typed text replaces selected text if a selection is active
