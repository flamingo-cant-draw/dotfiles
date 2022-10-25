;;; init-files.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages
 '(dired-collapse
   all-the-icons-dired
   dired-rainbow
   dired-subtree
   dired-git-info
   peep-dired))

(require 'files)
(require 'no-littering)

(require 'dired)
(require 'dired-collapse)
(require 'dired-rainbow)

;; set up proper backup
(setq
 backup-by-copying   t
 backup-directory-alist
 `(("." . ,(concat no-littering-var-directory "backup/")))
 auto-save-file-name-transforms
 `((".*" "~/.config/emacs/var/backup/" t))
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

;; Dired stuff

(setq dired-listing-switches "-alhv --group-directories-first"
      dired-dwim-target t)

(add-hook 'dired-mode-hook #'dired-collapse-mode)
(add-hook 'dired-mode-hook #'all-the-icons-dired-mode)
(add-hook 'dired-mode-hook #'dired-omit-mode)

;; Define some key bindinds for dired
(with-eval-after-load 'dired
  (when (version< emacs-version "28")
    (require 'dired-x))
  (define-key dired-mode-map (kbd "C-c c") #'dired-collapse-mode)
  (define-key dired-mode-map (kbd "C-, n") #'dired-subtree-next-sibling)
  (define-key dired-mode-map (kbd "C-, p") #'dired-subtree-previous-sibling)
  (define-key dired-mode-map (kbd "C-, u") #'dired-subtree-up)
  (define-key dired-mode-map (kbd "C-, d") #'dired-subtree-down)
  (define-key dired-mode-map (kbd "C-, a") #'dired-subtree-beginning)
  (define-key dired-mode-map (kbd "C-, e") #'dired-subtree-end)
  (define-key dired-mode-map (kbd "C-, k") #'dired-subtree-remove)
  (define-key dired-mode-map (kbd "M-i") #'dired-subtree-toggle)
  (define-key dired-mode-map (kbd ")") #'dired-git-info-mode)
  (define-key dired-mode-map (kbd "C-c p") #'peep-dired))

(provide 'init-files)

;;; init-files.el ends here
