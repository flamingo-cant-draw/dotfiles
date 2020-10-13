;;; init-dired.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(dired-collapse
		    all-the-icons-dired
		    dired-rainbow
		    dired-subtree
		    dired-git-info
		    peep-dired))
(require 'dired)
(require 'dired-collapse)
(require 'dired-rainbow)

(setq dired-listing-switches "-alh")

(add-hook 'dired-mode-hook #'dired-collapse-mode)
(add-hook 'dired-mode-hook #'all-the-icons-dired-mode)

;; Define some key bindinds for dired
(with-eval-after-load 'dired
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

(provide 'init-dired)

;;; init-dired.el ends here
