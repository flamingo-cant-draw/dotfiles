;;; init-rust.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(rustic))

(require 'rustic)

(add-hook 'rustic-mode-hook (lambda ()
							  (setq-local indent-tabs-mode nil)))

(provide 'init-rust)

;;; init-rust.el ends here
