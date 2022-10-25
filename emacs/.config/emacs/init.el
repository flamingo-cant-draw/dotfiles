;;; init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(when (version< emacs-version "28")
  (load-file (expand-file-name "early-init.el" user-emacs-directory)))

;; add emacs-config-dir/etc to the load-path (this is where all the init-* files are)
(let ((default-directory (concat user-emacs-directory "etc")))
  (normal-top-level-add-subdirs-to-load-path))
(normal-top-level-add-to-load-path (list (concat user-emacs-directory "etc")))

;; Set up packages
(require 'init-packages)

;; (setq gc-cons-threshold 67108864)

;; Pretty Emacs
(require 'init-looks)
;; (require 'init-dashboard)
(require 'init-editing)

;; File stuff
(require 'init-files)
;; (require 'init-treemacs)

;; Navigation
(require 'init-ivy)
(require 'init-navigation)

;; Programming stuff
(require 'init-company)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-prog-mode)
;; (require 'init-smartparens)
(require 'init-yas)

;; Writing stuff
(require 'init-abbrev)
(require 'init-writing)

;; Languages
(require 'init-cl)			; common lisp
(require 'init-d)
(require 'init-java)
(require 'init-org)
(require 'init-perl)
(require 'init-web)			; html, css, javascript etc.

;; Tertiary functionality
;; (require 'init-emms)
(require 'init-which-key)
;; (require 'init-frame-title)
;; (require 'init-toolbar)

;; config stuff I haven't found a place to put yet
(setq ring-bell-function 'ignore            ; don't play a noise whenever C-g is pressed
      save-interprogram-paste-before-kill t ; save what's in the clipboard to kill-ring before overriding it
      use-short-answers t)		    ; use `y-or-n-p' prompts intead of `yes-or-no-p'

(global-unset-key "\C-z")
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c f") #'find-file-at-point)

(require 'em-prompt)
(setq eshell-prompt-function
      (lambda ()
	(concat
	 (propertize (format "(%s)" (eshell/whoami)) 'face `(:foreground "#e86357" :weight bold))
	 " in "
	 (propertize (format "[%s]" (abbreviate-file-name (eshell/pwd))) 'face
		     `(:foreground "#5786d6" :slant italic))
	 "\n"
	 (propertize "~>" 'face `(:foreground "#73f573" :weight bold))
	 " ")))

(require 'calc)
(setq calc-multiplication-has-precedence nil)

(global-auto-revert-mode 1)

(exec-path-from-shell-initialize)
;; (put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(require 'japanese)
(setq quail-japanese-use-double-n t)

;; (let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
;;       (when (and opam-share (file-directory-p opam-share))
;;        ;; Register Merlin
;;        (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
;;        (autoload 'merlin-mode "merlin" nil t nil)
;;        ;; Automatically start it in OCaml buffers
;;        (add-hook 'tuareg-mode-hook 'merlin-mode t)
;;        (add-hook 'caml-mode-hook 'merlin-mode t)
;;        ;; Use opam switch to lookup ocamlmerlin binary
;;        (setq merlin-command 'opam)))

;; (setq utop-command "opam config exec -- dune utop . -- -emacs")

(provide 'init)

;;; init.el ends here
