;; ********** packages.el

;; ********** INITIALIZATION
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
        ("melpa"        . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(eval-and-compile
  (require 'use-package))


;; ********** INSTALL PACKAGES
;; git
(use-package magit)

;; clojure
; (use-package clojure-mode)
; (use-package cider)

;; python
(use-package auto-virtualenv)

;; miscellaneus languages
; (use-package go-mode)
(use-package markdown-mode)

;; text navigation
(use-package evil)
(use-package expand-region)

;; UI
(use-package doom-themes)
