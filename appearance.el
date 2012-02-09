(add-to-list 'custom-theme-load-path (concat root-dir "themes/"))

;; Disable splash page
(setq inhibit-startup-message t)

;; Set default font
;(set-face-attribute 'default nil :family "Monaco" :height 110)
(set-face-attribute 'default nil :family "Meslo LG M" :height 120)

;; Line spacing
(setq-default line-spacing 5)

;; set the initial frame size
(setq default-frame-alist '((top . 50) (left . 50) (width . 220) (height . 60)))
; (add-hook 'after-make-frame-functions
;           (lambda (selected-frame)
;             (frame-center selected-frame)))

;; Load Theme
(if window-system
    (load-theme 'molokai t)
  (load-theme 'tango-dark))

;; Draw fill column indicator at column 80
(setq-default fci-rule-column 80)
(setq-default fci-rule-use-dashes t)
(setq-default fci-dash-pattern 1.0)

;; Enable fill column indicator for all files
(add-hook 'after-change-major-mode-hook 'fci-mode)

;; Disable menu-bar
(menu-bar-mode 0)

;; Disable toolbar
(tool-bar-mode -1)

;; Scrollbar
(set-scroll-bar-mode 'nil)

;; Show matching paranthensis
(show-paren-mode t)

;; Show column number globally
(column-number-mode t)

;; Highlight current line globally
(global-hl-line-mode t)

;; Show line number gutter
(global-linum-mode 1)

;; Customize line numbers when Emacs runs in console
(if window-system
  (setq linum+-smart-format "%%%dd " linum+-dynamic-format "%%%dd "))

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Display whitespace characters globally
(global-whitespace-mode t)

;; Customize Whitespace Characters
;;  - Newline: \u00AC = ¬
;;  - Tab:     \u25B8 = ▸
(setq whitespace-display-mappings
      (quote ((newline-mark ?\n    [?\u00AC ?\n] [?$ ?\n])
              (tab-mark     ?\t    [?\u25B8 ?\t] [?\u00BB ?\t] [?\\ ?\t]))))

(setq whitespace-style
      (quote (face tabs trailing space-before-tab newline
                   indentation space-after-tab tab-mark newline-mark
                   empty)))

;; Cursor
(blink-cursor-mode t)
(setq initial-frame-alist
      (cons '(cursor-type . bar) (copy-alist initial-frame-alist)))
(setq default-frame-alist
      (cons '(cursor-type . bar) (copy-alist default-frame-alist)))

;; Transparency (via helpers.el)
(setq transparency-level 97)
(transparency-set-value transparency-level)
(add-hook 'after-make-frame-functions
         (lambda (selected-frame)
           (set-frame-parameter selected-frame 'alpha transparency-level)))
