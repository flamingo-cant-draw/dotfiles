;;; init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; add emacs-config-dir/elisp to the load-path (this is where all the init-* files are)
(dolist (dir '("general/" "langs/"  "programming/" "utils/"))
  (let ((default-directory (concat user-emacs-directory "etc/" dir)))
    (normal-top-level-add-subdirs-to-load-path)))

;; Set up packages
(require 'init-packages)

(setq gc-cons-threshold 67108864)

;; Pretty Emacs
(require 'init-looks)
;; (require 'init-dashboard)

;; File stuff
(require 'init-files)
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
(require 'init-cl)			; common lisp
(require 'init-d)
(require 'init-java)
(require 'init-org)
(require 'init-perl)
(require 'init-raku)			; what perl6 got renamed to
(require 'init-rust)
(require 'init-web)			; html, css, javascript etc.

;; Tertiary functionality
(require 'init-emms)
(require 'init-which-key)
(require 'init-frame-title)
;; (require 'init-toolbar)

;; config stuff I haven't found a place to put yet
(setq ring-bell-function 'ignore             ; don't play a noise whenever C-g is pressed
      save-interprogram-paste-before-kill t) ; save what's in the clipboard to kill-ring before overriding it

(global-unset-key "\C-z")

(setq ispell-program-name "aspell")
(setq-default ispell-extra-args '("--sug-mode=ultra"
				  "--lang=en_GB"
				  "--camel-case"))

(require 'em-prompt)
(setq eshell-prompt-function
      (lambda ()
	(concat
	 (propertize (format "(%s)" (eshell/whoami)) 'face `(:foreground "#e86357" :weight bold))
	 " in "
	 (propertize (format "[%s]" (abbreviate-file-name (eshell/pwd))) 'face `(:foreground "#5786d6" :slant italic))
	 "\n"
	 (propertize "~>" 'face `(:foreground "#73f573" :weight bold))
	 " ")))

(install-packages '(exec-path-from-shell))
(exec-path-from-shell-initialize)

(provide 'init)

;;; init.el ends here
(put 'downcase-region 'disabled nil)
