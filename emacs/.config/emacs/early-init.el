;;; early-init.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(setq package-user-dir (concat user-emacs-directory "var/elpa"))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(scroll-bar-mode -1)
(customize-set-variable 'tool-bar-position 'left)
;; (tool-bar-mode -1)
;; (menu-bar-mode -1)

(provide 'early-init)

;;; early-init.el ends here
