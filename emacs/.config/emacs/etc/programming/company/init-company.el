;;; init-company.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(company
		    company-box
		    company-dcd			; d-lang auto-complete
		    company-posframe))

(require 'company)
(require 'company-box)

(setq company-minimum-prefix-length 1	; show company after one char
      company-tooltip-align-annotations t
      company-show-numbers t)

(push '(company-semantic :with company-yasnippet) company-backends)

(add-hook 'prog-mode-hook #'company-mode)

(add-hook 'company-mode-hook 'company-box-mode)
(diminish 'company-mode)
(diminish 'company-box-mode)

(provide 'init-company)

;;; init-company.el ends here
