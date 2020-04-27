;;; init-treemacs.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(treemacs))

(require 'treemacs)

(global-set-key (kbd "C-c t t") #'treemacs)

(setq treemacs-width 26
      treemacs-is-never-other-window t)

(provide 'init-treemacs)

;;; init-treemacs.el ends here
