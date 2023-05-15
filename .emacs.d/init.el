;; ********** init.el
;; EMACS INIT CONFIG BOOTING THE LOADING PROCESS

;; load files where real configs are
(load "~/.emacs.d/lisp/packages.el")
(load "~/.emacs.d/lisp/paths.el")
(load "~/.emacs.d/lisp/generic.el")
(load "~/.emacs.d/lisp/modes.el")
(load "~/.emacs.d/lisp/bindings.el")
(load "~/.emacs.d/lisp/ui.el")
(load "~/.emacs.d/lisp/python.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d87f56d9a1171e45cd17bc229b0aeda729d9f980f256551f5d535fef75e6c1e9" default))
 '(package-selected-packages
   '(auto-virtualenv zenburn-theme use-package tree-sitter-langs markdown-mode magit expand-region evil doom-themes cider base16-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
