;;; init-files.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'files)
(require 'no-littering)

;; set up proper backup
(setq
 backup-by-copying   t
 backup-directory-alist
 `(("." . ,(concat no-littering-var-directory "backup/")))
 auto-save-file-name-transforms
 `((".*" "~/.config/emacs/var/auto-save/files/" t))
 delete-old-versions t
 kept-new-versions   6
 kept-old-versions   2
 version-control t)

;; put the code from any of the `customize' commands into
;; it's own file instead of appending to `init.el'
(setq custom-file (concat no-littering-var-directory "custom.el"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
;; if you do set up things in a `customize' prompt, you probably want it loaded
(load custom-file)

;; move files to ~/.local/share/Trash instead of deleting
(setq delete-by-moving-to-trash t)

(provide 'init-files)

;;; init-files.el ends here
