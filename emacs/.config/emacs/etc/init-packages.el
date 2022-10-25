;;; init-packages.el --- -*- lexical-binding: t -*-

;;; Commentary:

;; Set up package repos(melpa) and install base packages

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; (unless (bound-and-true-p package--initialized)
;;   (package-initialize))

(defvar init-packages-default-packages
  '(diminish
    no-littering

    sly
    d-mode
    raku-mode
    lua-mode
    rustic

    undo-tree

    smartparens

    which-key

    whole-line-or-region
    exec-path-from-shell
    )
  "List of we want packages installed regardless of what features are loaded.")

;;;###autoload
(defun install-packages (packages)
  "Install a list of Emacs packages.
PACKAGES is the list of packages you want to install."
  (dolist (package packages)
    (unless (package-installed-p package)
      (unless package-archive-contents
	(package-refresh-contents))
      (package-install package))))

(install-packages init-packages-default-packages)

;; keep `user-emacs-directory' clean
;; need to be initalised as early as possible
(require 'no-littering)

;; Pin packages, packages that we want to be installed form a specific repository
(setq package-pinned-packages
      '((emms . "gnu")
	(peg . "gnu")))

;; Add packages not installed with package.el to load-path
(defvar init-site-lisp-path (no-littering-expand-var-file-name "site-lisp/")
  "The path to the site-lisp directory.
This is where non-package.el packages are installed to.")

(let ((default-directory init-site-lisp-path))
  (unless (file-directory-p init-site-lisp-path)
    (mkdir init-site-lisp-path t))
  (normal-top-level-add-subdirs-to-load-path))

(provide 'init-packages)

;;; init-packages.el ends here
