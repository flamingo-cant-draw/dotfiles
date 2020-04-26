;;; init-el.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(sly))

(require 'sly)
;; (require 'sly-mrepl)

(setq inferior-lisp-program "/usr/bin/sbcl"
      sly-mrepl-history-file-name (concat user-emacs-directory ".cache/sly-mrepl-history"))

(add-hook 'sly-mrepl-hook (lambda ()
				(display-line-numbers-mode)
				(smartparens-mode)
				(company-mode)))

(provide 'init-cl)

;;; init-el.el ends here
