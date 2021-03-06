;;; init-ivy.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(ivy
		    counsel
		    swiper
		    ivy-rich
		    flyspell-correct-ivy))

(require 'ivy)
(require 'counsel)
(require 'ivy-rich)
(require 'flyspell)
(ivy-mode 1)
(diminish 'ivy-mode)
(ivy-rich-mode 1)

(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

(setq ivy-use-virtual-buffers t
      ivy-count-format "(%d/%d) "
      ivy-height 7)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "C-x 8 RET") 'counsel-unicode-char)
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-correct-wrapper)

(provide 'init-ivy)

;;; init-ivy.el ends here
