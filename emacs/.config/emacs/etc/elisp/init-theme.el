;;; init-theme.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; install colour and modeline theme
(install-packages '(doom-modeline
					doom-themes
					highlight-numbers
					hl-todo		 ; highlight todo, fixme etc. comments
					;; highlight-indent-guides
					))

(set-frame-font "Hack 11" nil t)

(load-theme 'doom-city-lights t)
(doom-themes-treemacs-config)

;; (require 'kaolin-themes)
;; (setq kaolin-themes-modeline-border t
;; 	  kaolin-themes-underline-wave nil)

;; (load-theme 'kaolin-galaxy t)
;; (kaolin-treemacs-theme)
(doom-modeline-mode 1)

;; `highlight-indent-guides-mode' is great, but it just makes scrolling through a file with
;; `C-n' and `C-p' to laggy
;; (require 'highlight-indent-guides)
;; (setq highlight-indent-guides-method 'bitmap
;; 	  highlight-indent-guides-responsive nil)

(add-hook 'prog-mode-hook (lambda ()
							(highlight-numbers-mode)
							;; (highlight-indent-guides-mode)
							(hl-todo-mode)))

(diminish 'highlight-indent-guides-mode)

;; highlight the current line
(global-hl-line-mode)

(provide 'init-theme)

;;; init-theme.el ends here
