;;; early-init.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(setq package-user-dir (concat user-emacs-directory "var/elpa"))
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
	  (expand-file-name  "var/eln-cache/" user-emacs-directory))))
;; (setq gc-cons-threshold 100000000)
;; (setq package-enable-at-startup nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-screen t)

(customize-set-variable 'tool-bar-position 'left)

(provide 'early-init)

;;; early-init.el ends here
