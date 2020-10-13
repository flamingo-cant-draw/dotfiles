;;; init-org.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'org)
(setq org-file-apps
      '((auto-mode . emacs)
	("\\.mm\\'" . default)
	("\\.x?html?\\'" . "/usr/bin/firefox %s")
	("\\.pdf\\'" . default)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)))

(add-hook 'org-mode-hook #'display-line-numbers-mode)

(provide 'init-org)

;;; init-org.el ends here
