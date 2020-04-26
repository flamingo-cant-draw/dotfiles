;;; init-which-key.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(which-key which-key-posframe))


(require 'which-key)
(require 'which-key-posframe)

;; `which-key' is a package that shows the current shortcuts
;; avaliable from a given prefix

(which-key-mode 1)
(which-key-posframe-mode 1)

(setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-left-corner
	  which-key-idle-delay 0.5)

(provide 'init-which-key)

;;; init-which-key.el ends here
