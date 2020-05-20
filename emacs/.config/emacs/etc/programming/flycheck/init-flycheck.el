;;; init-flycheck.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(flycheck
					flycheck-posframe))

(require 'flycheck)
(setq flycheck-emacs-lisp-load-path 'inherit)

(global-flycheck-mode 1)
(add-hook 'flycheck-mode-hook 'flycheck-posframe-mode)

(provide 'init-flycheck)

;;; init-flycheck.el ends here
