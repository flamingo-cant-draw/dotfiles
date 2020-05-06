;;; init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; add emacs-config-dir/elisp to the load-path (this is where all
;; the init-* files are)
(add-to-list 'load-path (concat user-emacs-directory "etc/elisp"))
(dolist (dir '("langs/" "general/" "utils/" "programming/"))
  (let ((default-directory (concat user-emacs-directory "etc/" dir)))
	(normal-top-level-add-subdirs-to-load-path)))

;; Set up packages
(require 'init-packages)

;; Pretty Emacs
(require 'init-theme)
(require 'init-dashboard)

;; File stuff
(require 'init-files)    ; dired stuff is also here
(require 'init-dired)
(require 'init-treemacs)

;; Navigation
(require 'init-ivy)
(require 'init-winum)
(require 'init-avy)

;; Programming stuff
(require 'init-company)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-prog-mode)
(require 'init-smartparens)
(require 'init-yas)

;; Languages
(require 'init-cl)    ; common lisp
(require 'init-d)
(require 'init-java)
(require 'init-org)
(require 'init-perl)
(require 'init-raku)  ; what perl6 got renamed to
(require 'init-rust)
(require 'init-web)   ; html, css, javascript etc.

;; Tertiary functionality
(require 'init-emms)
(require 'init-which-key)
(require 'frame-title)

(setq ring-bell-function 'ignore
	  save-interprogram-paste-before-kill t)

(global-set-key "\C-z" nil)

(setq ispell-program-name "aspell")
(setq-default ispell-extra-args '("--sug-mode=ultra"
								  "--lang=en_GB"
								  "--camel-case"))

(exec-path-from-shell-initialize)

(provide 'init)

;;; init.el ends here
