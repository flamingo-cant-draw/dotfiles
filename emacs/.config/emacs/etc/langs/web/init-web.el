;;; init-web.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(web-mode
		    emmet-mode
		    js2-mode
		    json-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mod))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook #'emmet-mode)

(require 'css-mode)
(add-hook 'css-mode-hook (lambda ()
			   (setq indent-tabs-mode t
				 tab-width 2
				 css-indent-offset 2)))


(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(provide 'init-web)

;;; init-web.el ends here
