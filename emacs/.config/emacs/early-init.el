;;; early-init.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(setq package-user-dir (concat user-emacs-directory "var/elpa"))
(setq gc-cons-threshold 100000000)
(setq package-enable-at-startup nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(customize-set-variable 'tool-bar-position 'left)

(setq-default left-fringe-width 0
	      right-fringe-width 0)

(provide 'early-init)

;;; early-init.el ends here
