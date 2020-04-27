;;; init-dired.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(dired-collapse
					all-the-icons-dired
					dired-rainbow))
(require 'dired)
(require 'dired-collapse)

(setq dired-listing-switches "-alh")

(add-hook 'dired-mode-hook (lambda ()
							 (dired-collapse-mode)
							 (all-the-icons-dired-mode)))


(provide 'init-dired)

;;; init-dired.el ends here
