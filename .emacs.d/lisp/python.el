;; ********** python.el
;; NECESSARY SETTINGS FOR A MORE DYNAMIC PYTHON DEVELOPMENT WORKFLOW

;; import necessary functionalities
(require 'auto-virtualenv)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; change name of virtual environment folder
;; (setq auto-virtualenv-custom-virtualenv-path ".env")

;; hook to set the virtual environment for the loaded file
(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)

;; hook to add a local keybinding only in python-mode
;; (local & attached to the mode --> active only in python mode --> which runs only when loading a python file)
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "M-RET") 'python-shell-send-region)))
