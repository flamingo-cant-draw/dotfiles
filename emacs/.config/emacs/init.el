;;; init.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; add emacs-config-dir/elisp to the load-path (this is where all
;; the init-* files are)
(add-to-list 'load-path (concat user-emacs-directory "etc/elisp"))
(let ((default-directory (concat user-emacs-directory "etc/langs")))
  (normal-top-level-add-to-load-path '("common-lisp" "d" "java" "perl" "raku" "rust" "web")))

;; set up packages
(require 'init-packages)

;; pretty Emacs
(require 'init-theme)
(require 'init-dashboard)

;; file stuff
(require 'init-files)    ; dired stuff is also here
(require 'init-treemacs)

;; navigation
(require 'init-ivy)
(require 'init-winum)

(require 'init-company)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-smartparens)
(require 'init-yas)
(require 'init-which-key)
(require 'init-avy)

(require 'init-emms)
(require 'exwm)

;; languages
(require 'init-cl)    ; common lisp
(require 'init-d)
(require 'init-java)
(require 'init-org)
(require 'init-perl)
(require 'init-raku)
(require 'init-rust)
(require 'init-web)   ; html, css, javascript etc.

(setq ring-bell-function 'ignore)

(save-place-mode 1)

(setq save-interprogram-paste-before-kill t)

(install-packages '(undo-tree))
(global-undo-tree-mode 1)

(defun formaty ()
  "`indent-region' on whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

(defmacro file-name-title-setter (file-name title &rest check-extensions)
  `(list (list 'string-match-p (list 'string-join ''(,@check-extensions) '"\\|") ,file-name)
		 (list 'setq 'frame-title-format ''(,title))))

(defun set-frame-title-based-on-buffer (func &rest args)
  "Set the title of the frame based on the buffer we are in.
FUNC is the function we are advising, ARGS are its arguments."
  (apply func args)

  (let* ((file-name (buffer-name))
		 (conditionals (list
						(file-name-title-setter file-name "Ahh, elisp" ".el$")
						(file-name-title-setter file-name "🦀🦀🦀 GC is gone 🦀🦀🦀" ".rs$")
						(file-name-title-setter file-name "The original camel themed language" ".perl$" ".pm$")
						(file-name-title-setter file-name "Classy" ".java$")
						(file-name-title-setter file-name "The only gem I need is you ;)" ".rb$" "Gemfile")
						(file-name-title-setter file-name "C-ing is the easiest way to know what you're doing" ".c$")
						(file-name-title-setter file-name "Getting ahead?" ".h$")
						'(t (setq frame-title-format '("%b"))))))
    (eval `(cond ,@conditionals))))

(advice-add #'other-window          :around #'set-frame-title-based-on-buffer)
(advice-add #'counsel-switch-buffer :around #'set-frame-title-based-on-buffer)
(advice-add #'find-file             :around #'set-frame-title-based-on-buffer)
(advice-add #'previous-buffer       :around #'set-frame-title-based-on-buffer)
(advice-add #'next-buffer           :around #'set-frame-title-based-on-buffer)
(advice-add #'quit-window           :around #'set-frame-title-based-on-buffer)


(global-set-key "\C-z" nil)
(global-set-key (kbd "C-x C-\\") #'formaty)

(setq-default tab-width 4)

(setq ispell-program-name "aspell")
(setq-default ispell-extra-args '("--sug-mode=ultra"
								  "--lang=en_GB"
								  "--camel-case"))

(global-visual-line-mode 1)
(diminish 'visual-line-mode)

;; make it so `M-w' and `C-w' copy/kill the current line if no region is selected
;; taked from http://emacs-fu.blogspot.com/2009/11/copying-lines-without-selecting-them.html
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-beginning-position 2)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position) (line-beginning-position 2)))))

;; repeated `C-n's can
;; (setq auto-window-vscroll nil)

(global-subword-mode 1)

(add-hook 'prog-mode-hook (lambda ()
							(display-line-numbers-mode)
							;; the following is to get 'auto-newline' functionality(Example:
							;; {|} + RET --> {
							;;     |
							;; }).
							;; Emacs' inbuilt `electric-indent-mode' only supports this when `electric-pair-mode' is active.
							;; However turning `electric-pair-local-mode' on then off activates this(but not `electric-pair-mode' proper for some reason).
							;; This allows us to use `smartparens' while still having this nice-to-have feature without
							;; playing around with post-hooks.
							(electric-pair-local-mode)
							(electric-pair-local-mode -1)))

(provide 'init)

;;; init.el ends here
