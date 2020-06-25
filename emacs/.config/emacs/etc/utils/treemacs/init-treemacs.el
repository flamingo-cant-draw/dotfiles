;;; init-treemacs.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(treemacs))

(require 'treemacs)

(global-set-key (kbd "C-c t t") #'treemacs)
(global-set-key (kbd "C-c t s") #'treemacs-select-window)
(global-set-key (kbd "C-c t n") #'treemacs-create-file)
(global-set-key (kbd "C-c t d") #'treemacs-create-dir)

(setq treemacs-width 30
      treemacs-is-never-other-window t)

(provide 'init-treemacs)

;;; init-treemacs.el ends here
