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

(setq ring-bell-function 'ignore
	  save-interprogram-paste-before-kill t)

(defmacro file-name-title-setter (file-name title &rest check-extensions)
  "Macro to help setup the cond statement in `set-frame-title-based-on-buffer'.

FILE-NAME is the name of the file.
TITLE what you want to set the `frame-title-format' to.
CHECK-EXTENSIONS is just a list of extensions or file names you want to
check for(full regex functionality available).

Example:
 This:
   \(file-name-title-setter \"John.java\" \"Oh no, Java...\" \".java$\")
 Turns into:
   \((string-match-p (string-join \\='(\".java$\") \"\\|\") \"John.java\")
    (setq frame-title-format \\='(\"Oh no, Java...\")))"
  `(list (list 'string-match-p (list 'string-join ''(,@check-extensions) '"\\|") ,file-name)
		 (list 'setq 'frame-title-format ''(,title))))

(defun set-frame-title-based-on-buffer (&optional func &rest args)
  "Function to set the `frame-title-format' based on buffer we are in.
FUNC is the optional function to advise, ARGS is FUNC's arguments."
  (when func (apply func args))

  (let* ((file-name (buffer-name))
		 (conditionals (list
						(file-name-title-setter file-name "Ahh, elisp" ".el$")
						(file-name-title-setter file-name "🦀🦀🦀 GC is gone 🦀🦀🦀" ".rs$")
						(file-name-title-setter file-name "The original camel themed language" ".perl$" ".pm$")
						(file-name-title-setter file-name "Classy" ".java$")
						(file-name-title-setter file-name "The only gem I need is you ;)" ".rb$" "Gemfile")
						(file-name-title-setter file-name "C-ing is the easiest way to know what you're doing" ".c$")
						(file-name-title-setter file-name "Getting ahead?" ".h$")
						(file-name-title-setter file-name "Stylish" ".css$" ".scss$" ".sass$")
						(file-name-title-setter file-name "<tag>You're it</tag>" ".html$")
						(file-name-title-setter file-name "Oh god, oh fuck." ".js$" ".mjs$")
						'(t (setq frame-title-format '("%b"))))))
    (eval `(cond ,@conditionals))))

(advice-add #'other-window                  :around #'set-frame-title-based-on-buffer)
(advice-add #'counsel-switch-buffer         :around #'set-frame-title-based-on-buffer)
(advice-add #'find-file                     :around #'set-frame-title-based-on-buffer)
(advice-add #'previous-buffer               :around #'set-frame-title-based-on-buffer)
(advice-add #'next-buffer                   :around #'set-frame-title-based-on-buffer)
(advice-add #'quit-window                   :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-1         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-2         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-3         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-4         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-5         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-6         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-7         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-8         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-9         :around #'set-frame-title-based-on-buffer)
(advice-add #'winum-select-window-by-number :around #'set-frame-title-based-on-buffer)

(global-set-key "\C-z" nil)

(setq ispell-program-name "aspell")
(setq-default ispell-extra-args '("--sug-mode=ultra"
								  "--lang=en_GB"
								  "--camel-case"))

(provide 'init)

;;; init.el ends here
