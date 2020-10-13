;;; init-rust.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(rustic))

(require 'rustic)
(require 'lsp)

(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-command '("~/.local/bin/rust-analyzer")
      )

(add-hook 'rustic-mode-hook (lambda ()
			      (setq-local indent-tabs-mode nil)))

(provide 'init-rust)

;;; init-rust.el ends here
