;; ********** bindings.el
;; CONFIG RELATED TO GENERIC BINDINGS (THOSE ASSOCIATED WITH A SPECIFIC LANGUAGE CAN BE FOUND IN THE LANGUAGE FILE)

;; explicitly enable some stuff
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; unbind/disable some default keymaps
(dolist (key '("\M-v"
               "\C-v"
               "\C-xm"
               ;; "\C-s"
               "\C-j"
               "\C-i"))
  (global-unset-key key))

;; run command from minibuffer
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; jump to first char if pressed once, to start of line if pressed twice
(global-set-key (kbd "C-a") 
                (lambda ()
                  (interactive)
                  (if (= (point) (progn (back-to-indentation) (point)))
                      (beginning-of-line))))

;; remapping search
;; (global-set-key (kbd "C-f") 'isearch-forward)
;; (define-key isearch-mode-map "\C-f" 'isearch-repeat-forward) ; necessary cause once in search mode isearch has its own keybindings (C-h b to inspect once in search mode)

;; remapping Ctrl-s to next character
;; (global-set-key (kbd "C-s") 'forward-char)

;; (global-set-key (kbd "C-e") 'end-of-line)

;; indent and untabify region or line
(global-set-key (kbd "TAB")
                (lambda ()
                  (interactive)
                  (if (region-active-p)
                      (progn
                        (indent-region (region-beginning) (region-end))
                        (untabify (region-beginning) (region-end)))
                    (progn (insert "\t")
                           (untabify (line-beginning-position) (line-end-position))))))

;; reload init file
(global-set-key (kbd "C-c l") 
                (lambda ()
                  (interactive)
                  (load-file (concat user-emacs-directory "init.el"))))

;; (global-set-key (kbd "M-=") 'er/expand-region)
;; (global-set-key (kbd "M--") 'er/contract-region)
(global-set-key (kbd "M-j") 'er/expand-region)
(global-set-key (kbd "M-k") 'er/contract-region)

;; this lambda selects the whole line
;; or removes any previously set marks
(global-set-key (kbd "M-l")
                (lambda ()
                  (interactive)
                  (if (symbol-value mark-active)
                      (deactivate-mark)
                    (progn
                      (set-mark-command (beginning-of-line))
                      (end-of-line)))))

(global-set-key (kbd "M-n") 'scroll-up-command)
(global-set-key (kbd "M-p") 'scroll-down-command)
(global-set-key (kbd "M-u") 'upcase-region)
;; (global-set-key (kbd "C-c C-u") 'capitalize-region)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)

;; TODO: keep the same binding for all modes, requires some programming
;; (global-set-key (kbd "M-RET") 'cider-eval-last-sexp)

;; dired
(define-key dired-mode-map "-" 'dired-up-directory)
