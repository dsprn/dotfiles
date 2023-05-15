;; ********** ui.el
;; UI RELATED CONFIGS

;; disable some features
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; set cursor type
(setq-default cursor-type 'box)

;; set font (only works on GUI Emacs)
(setq default-frame-alist '((font . "JetBrains Mono Medium-13")))

;; invert colors for default dark theme (lighter than downloading a theme but not as pretty)
;; (invert-face 'default)
(load-theme 'doom-tomorrow-night t)
