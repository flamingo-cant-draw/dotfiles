;;; init-org.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'org)
(setq org-file-apps
    (quote
        ((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . "/usr/bin/firefox %s")
        ("\\.pdf\\'" . default))))

(add-hook 'org-mode-hook #'display-line-numbers-mode)

(provide 'init-org)

;;; init-org.el ends here
