;;; init-files.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(dired-collapse
					all-the-icons-dired
					dired-rainbow
					no-littering))

(require 'files)

;; keep `user-emacs-directory' clean
(require 'no-littering)

;; set up proper backup
(setq
 backup-by-copying      t
 backup-directory-alist (cons (cons "." (concat no-littering-var-directory "saves/")) nil)
 delete-old-versions    t
 kept-new-versions      6
 kept-old-versions      2)

;; put the code from any of the `customize' commands into
;; it's own file instead of appending to `init.el'
(setq custom-file (concat no-littering-var-directory "custom.el"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
;; if you do set up things in a `customize' prompt, you probably want it loaded
(load custom-file)

;; move files to ~/.local/share/Trash instead of deleting
(setq delete-by-moving-to-trash t)

;; Dired stuff
(require 'dired)
(require 'dired-collapse)

(setq dired-listing-switches "-alh")

(add-hook 'dired-mode-hook (lambda ()
							 (dired-collapse-mode)
							 (all-the-icons-dired-mode)))

(provide 'init-files)

;;; init-files.el ends here
