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

(provide 'early-init)

;;; early-init.el ends here
