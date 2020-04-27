;;; init-flycheck.el --- -*- lexical-binding: t -*-

;;; Code:

(install-packages '(flycheck
		    flycheck-posframe))

(global-flycheck-mode 1)
(add-hook 'flycheck-mode-hook 'flycheck-posframe-mode)

(provide 'init-flycheck)

;;; init-flycheck.el ends here
