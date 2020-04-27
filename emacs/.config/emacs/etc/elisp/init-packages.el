;;; init-packages.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Set up package repos(melpa) and install base packages

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(defun install-packages (packages)
  "Install a list of Emacs packages.
PACKAGES is the list of packages you want to install."
  (dolist (package packages)
    (unless (package-installed-p package)
      (unless package-archive-contents
		(package-refresh-contents))
      (package-install package))))


(install-packages '(diminish auto-package-update no-littering))

;; keep `user-emacs-directory' clean
;; need to be initalised as early as possible
(require 'no-littering)

;; hide base modes from modeline
(diminish 'eldoc-mode)

;; auto update packages at 18:00
(require 'auto-package-update)

(setq auto-package-update-last-update-day-filename
	  (concat user-emacs-directory "var/last-package-update-day"))

(auto-package-update-at-time "18:00")

(provide 'init-packages)

;;; init-packages.el ends here
