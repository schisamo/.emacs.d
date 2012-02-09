;; Seth Chisamore's Emacs Configuration
;; original inspiration: https://github.com/jimeh/.emacs.d

;; no path hard-coding plz
(defvar root-dir (file-name-directory load-file-name))

;; Loose Scripts
(defvar scripts-dir (concat root-dir "scripts/"))
(add-to-list 'load-path scripts-dir)
(when (file-exists-p scripts-dir)
  (mapc 'load (directory-files scripts-dir nil "^[^#].*el$")))

;; Modularize ALL THE THINGS
(load-file (concat root-dir "env.el"))
(load-file (concat root-dir "helpers.el"))
(load-file (concat root-dir "packages.el"))
(load-file (concat root-dir "languages.el"))
(load-file (concat root-dir "behavior.el"))
(load-file (concat root-dir "appearance.el"))
(load-file (concat root-dir "keybindings.el"))

;; Custom variables file
(setq custom-file (concat root-dir "custom-variables.el"))
(load-file custom-file)
