;;
;; Load Package/ELPA - installs if necessary
;;
(add-to-list 'load-path (concat root-dir "elpha"))

(defun install-elpa ()
  (eval-url "http://tromey.com/elpa/package-install.el"))

(if (require 'package nil t)
    (progn
      ;; Emacs 24+ includes ELPA, but requires some extra setup
      ;; to use the (better) tromey repo
      (if (>= emacs-major-version 24)
          (setq package-archives
                (cons '("tromey" . "http://tromey.com/elpa/")
                package-archives)))

      (package-initialize))
  (install-elpa))

;;
;; Load el-get - installs if necessary
;;
(add-to-list 'load-path (concat root-dir "el-get/el-get"))

(defun install-el-get ()
  (eval-url
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"))

(unless (require 'el-get nil t)
  (install-el-get))

;;
;; el-get Sources
;;
(setq el-get-sources
      '((:name css-mode
               :type elpa
               :features css-mode)
        (:name dirtree
               :description "Directory tree views in Emacs"
               :type git
               :url "https://github.com/zkim/emacs-dirtree.git"
               :depends (tree-mode windata)
               :features dirtree)
        (:name fill-column-indicator
               :type git
               :url "git://github.com/alpaker/Fill-Column-Indicator.git"
               :features fill-column-indicator)
        (:name linum+
               :type emacswiki
               :features linum+)
        (:name magit
               :type git
               :url "https://github.com/magit/magit.git"
               :features magit)
        (:name rhtml
               :type git
               :url "https://github.com/crazycode/rhtml.git"
               :features rhtml-mode)
        (:name ruby-mode
               :type svn
               :url "http://svn.ruby-lang.org/repos/ruby/trunk/misc/")
        (:name solarized-theme
               :type git
               :url "https://github.com/bbatsov/solarized-emacs.git"
               :load "solarized-theme.el")
        (:name tree-mode
               :type emacswiki
               :features tree-mode)
        (:name yaml-mode
               :type git
               :url "https://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode)
        (:name windata
               :type emacswiki
               :features windata)
        (:name erlang
                :type git
                :url "https://github.com/erlang/otp.git"
                :load-path ("./lib/tools/emacs")
                :shallow t)))

;;
;; My Packages
;;
(setq my-packages
      (append
       '(auto-complete
         autopair
         coffee-mode
         color-theme-tomorrow
         cssh
         ecb
         escreen
         full-ack
         git-blame
         git-emacs
         inf-ruby
         markdown-mode
         php-mode-improved
         ruby-compilation
         smex
         solarized-theme
         textmate
         undo-tree)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
(el-get 'wait)
