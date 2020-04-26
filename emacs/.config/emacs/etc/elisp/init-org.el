;;; init-org.el --- -*- lexical-binding: t -*-

;;; Code:

(setq org-file-apps
    (quote
        ((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . "/usr/bin/firefox %s")
        ("\\.pdf\\'" . default))))

(provide 'init-org)

;;; init-org.el ends here
