;;; init-org.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'org)
(setq org-file-apps
      '((auto-mode . emacs)
	("\\.mm\\'" . default)
	("\\.x?html?\\'" . "/usr/bin/firefox %s")
	("\\.pdf\\'" . default))
      org-startup-indented t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)))

(add-hook 'org-mode-hook #'display-line-numbers-mode)
(add-hook 'org-mode-hook (lambda () (set-fill-column 80)))
(add-hook 'org-mode-hook #'abbrev-mode)

(with-eval-after-load 'org-indent
  (diminish #'org-indent-mode))

(provide 'init-org)

;;; init-org.el ends here
