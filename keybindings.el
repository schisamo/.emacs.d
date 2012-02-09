;; Lion full-screen
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-M-F") 'ns-toggle-fullscreen)

;; hide emacs
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)

;; Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
