;;; init-lsp.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; Language server setup.
;;; Code:

(install-packages
 '(lsp-mode
   lsp-ui
   lsp-java
   lsp-treemacs
   dap-mode
   ccls))

(require 'lsp-mode)
(require 'lsp-ui)

(with-eval-after-load 'lsp-mode
  (let ((lsp-modes '(rust-mode-hook java-mode-hook)))
    (dolist (mode lsp-modes)
      (add-hook mode #'lsp)))
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(setq lsp-prefer-capf t)

;; debugging protocall
(require 'dap-mode)

(add-hook 'lsp-mode-hoook #'dap-mode)
(add-hook 'lsp-mode-hoook #'dap-ui-mode)
(add-hook 'lsp-mode-hoook #'tooltip-mode)
(add-hook 'java-mode-hook (lambda () (require 'dap-java)))

;; keybindings
(define-key dap-mode-map (kbd "<f5>") #'dap-debug)
(define-key dap-mode-map (kbd "S-<f5>") #'dap-debug-last)

(provide 'init-lsp)

;;; init-lsp.el ends here
