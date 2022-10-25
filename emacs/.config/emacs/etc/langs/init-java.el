;;; init-java.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'cc-mode)

(add-hook 'java-mode-hook (lambda ()
                            (setq-local c-basic-offset 4
					tab-width 4
					indent-tabs-mode t)))

(provide 'init-java)

;;; init-java.el ends here
