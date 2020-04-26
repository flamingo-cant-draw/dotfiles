;;; init-lsp.el --- language server setup -*- lexical-binding: t -*-

;;; Commentary:

;; Language server setup.

;;; Code:

(install-packages '(lsp-mode
		    lsp-ui
		    company-lsp
		    lsp-java
		    lsp-treemacs
		    dap-mode))

(require 'lsp-mode)
(require 'lsp-ui)

(defvar lsp-modes
  (list 'ruby-mode-hook 'rust-mode-hook
	'python-mode-hook 'd-mode-hook 'java-mode-hook)
  "Modes where we want to enable `lsp-mode'.")

(dolist (mode lsp-modes)
  (add-hook mode #'lsp))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(require 'company-lsp)
(add-to-list 'company-lsp-filter-candidates '(lsp-emmy-lua . t))

;; debugging protocall
(require 'dap-mode)

(add-hook 'lsp-mode-hook (lambda ()
						   (dap-mode 1)
						   (dap-ui-mode 1)
						   (tooltip-mode 1)))


(add-hook 'java-mode-hook (lambda () (require 'dap-java)))

;; keybindings
(define-key dap-mode-map (kbd "<f5>") #'dap-debug)
(define-key dap-mode-map (kbd "S-<f5>") #'dap-debug-last)


(provide 'init-lsp)

;;; init-lsp.el ends here
