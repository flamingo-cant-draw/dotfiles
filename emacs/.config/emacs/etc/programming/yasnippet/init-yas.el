;;; init-yas.el --- snippet completion for Emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(yasnippet
		    yasnippet-snippets
		    common-lisp-snippets))

(require 'yasnippet)
(setq yas-snippet-dirs (append yas-snippet-dirs
			       (list (concat user-emacs-directory "etc/programming/yasnippet/snippets"))))

(yas-global-mode)

(with-eval-after-load 'yasnippet
  (yas-reload-all))
(diminish 'yas-minor-mode)

(provide 'init-yas)

;;; init-yas.el ends here
