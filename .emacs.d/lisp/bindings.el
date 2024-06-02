;; ********** bindings.el

;; unbind/disable some default keymaps
(dolist (key '("\M-v"
               "\C-v"
               "\C-xm"
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
(global-set-key (kbd "C-M-u") 'capitalize-region)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)

;; dired
(define-key dired-mode-map "-" 'dired-up-directory)
