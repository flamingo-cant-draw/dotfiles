;;; init-smartparens --- -*- lexical-binding: t -*-

;;; Commentary:

;; Powerful parentheses management tool

;;; Code:

(install-packages '(smartparens))

(require 'smartparens-config)
(require 'smartparens)

(add-hook 'prog-mode-hook (lambda ()
			    (smartparens-mode)
			    (show-smartparens-mode)))
(add-hook 'sly-mrepl-mode (lambda ()
			    (smartparens-mode)
			    (show-smartparens-mode)))

;; Mostly the normal `sp-smartparens-bindings' except `C-S-<backspace>'
;; is now `C-c <backspace>' as I use the `kill-whole-line' command regularly
(define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key smartparens-mode-map (kbd "C-S-d") 'sp-beginning-of-sexp)
(define-key smartparens-mode-map (kbd "C-S-a") 'sp-end-of-sexp)
(define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
(define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)
(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)
(define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)
(define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)
(define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
(define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key smartparens-mode-map (kbd "C-c <backspace>") 'sp-splice-sexp-killing-around)
(define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)
(define-key smartparens-mode-map (kbd "C-M-SPC") 'sp-mark-sexp)
(define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
(define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)


(diminish 'smartparens-mode)

(provide 'init-smartparens)

;;; init-smartparens.el ends here
