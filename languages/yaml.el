(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\.example$" . yaml-mode))

(add-hook 'yaml-mode-hook
  (lambda ()
     (fci-mode)
     (linum-mode t)
     (define-key yaml-mode-map (kbd "RET") 'newline-and-indent)))
