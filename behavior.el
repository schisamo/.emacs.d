;; Default tab-width of 2 spaces
(setq-default tab-width 2)

;; Always indent with spaces
(setq-default indent-tabs-mode nil)

;; Answer yes/no questions by typing y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Map the ALT and the META key close to a "normal" Unix behavior
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; Enable C-x C-l and C-x C-u for down/up-case conversions
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Globally enable delete-selection-mode
(delete-selection-mode 1)

;; Don't backup or auto-save files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 10)) ;; two lines at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1 ;; keyboard scroll one line at a time
      scroll-margin 0)

;; Smex
(smex-initialize)

(defun smex-update-after-load (unused)
      (when (boundp 'smex-cache)
        (smex-update)))
    (add-hook 'after-load-functions 'smex-update-after-load)

;; http://stackoverflow.com/questions/5201052/how-to-prevent-emacs-annoying-habit-of-adding-the-current-word-to-any-command-bu

(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-everywhere t)
(ido-mode 1)
