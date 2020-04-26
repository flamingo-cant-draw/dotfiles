;;; init-yas.el --- snippet completion for Emacs -*- lexical-binding: t -*-

;;; Code:

(install-packages '(yasnippet
		    yasnippet-snippets
		    common-lisp-snippets))

(yas-global-mode 1)
(yas-reload-all)

(diminish 'yas-minor-mode)

(provide 'init-yas)

;;; init-yas.el ends here
