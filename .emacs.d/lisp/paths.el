;; ********** paths.el
;; CONFIGURE PATHS OF FILES BACKUPS AND AUTOSAVES

;; backups and autosaves
;; create dirs if they don't exist
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; set variables to save files in the created dirs
(setq auto-save-file-name-transforms 
	  '((".*" "~/.emacs.d/autosaves/\\1" t)))
(setq backup-directory-alist 
	  '((".*" . "~/.emacs.d/backups")))

;; not needed on a single user workstation
(setq create-lockfiles nil)
