;;; init-winum.el ---  -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(winum))

(setq winum-keymap
      (let ((map (make-sparse-keymap)))
	(define-key map (kbd "C-`") 'winum-select-window-by-number)
	(define-key map (kbd "C-²") 'winum-select-window-by-number)
	(define-key map (kbd "M-0") 'treemacs-select-window)
	(define-key map (kbd "M-1") 'winum-select-window-1)
	(define-key map (kbd "M-2") 'winum-select-window-2)
	(define-key map (kbd "M-3") 'winum-select-window-3)
	(define-key map (kbd "M-4") 'winum-select-window-4)
	(define-key map (kbd "M-5") 'winum-select-window-5)
	(define-key map (kbd "M-6") 'winum-select-window-6)
	(define-key map (kbd "M-7") 'winum-select-window-7)
	(define-key map (kbd "M-8") 'winum-select-window-8)
	map))

(require 'winum)

(winum-mode)

(provide 'init-winum)

;;; init-winum.el ends here