;;; init-prog-mode.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; Config for general programming.
;;; Code:

;; install some modes
(install-packages
 '(lua-mode
   yaml-mode
   csharp-mode
   json-mode
   ))

(add-hook 'prog-mode-hook #'subword-mode)

;; Make camelCase vars easier to read snake_case
;; (require 'glasses)
;; (setq
;;  ;; glasses-face 'bold-italic
;;  glasses-separator "~"
;;  ;; if this isn't set then it `glasses-mode' messes up snake_case variables
;;  ;; glasses-original-separator "~"
;;  ;; glasses-separate-parentheses-p nil
;;  )
;; (glasses-set-overlay-properties)

;; Don't show the minor modes in modeline we don't want to know about
(diminish 'visual-line-mode)
(diminish 'undo-tree-mode)
;; Just `(diminish 'subword-mode)' for whatever reason doesn't work
(add-hook 'subword-mode-hook
	  #'(lambda () (diminish 'subword-mode)))
(diminish 'glasses-mode " 👓")
(diminish 'eldoc-mode)

;; Easily format whole buffer(C-h C-M-\ moves the point so gets annoying)
(defun init-indent-whole-buffer ()
  "`indent-region' on the whole buffer and `delete-trailing-whitespce'."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

(global-set-key (kbd "C-x C-\\") #'init-indent-whole-buffer)

(require 'display-line-numbers)
(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
;; (add-hook 'prog-mode-hook #'glasses-mode)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

;; the following is to get 'auto-newline' functionality
;; Example:
;; {|} + RET --> {
;;     |
;; }.
;; Emacs' inbuilt `electric-indent-mode' only supports this when `electric-pair-mode' is active.
;; However turning `electric-pair-local-mode' on then off activates
;; this(but not `electric-pair-mode' proper for some reason).
;; This allows us to use `smartparens' while still having this nice-to-have feature without
;; playing around with post-hooks.
;; (add-hook 'prog-mode-hook (lambda ()
;; 			    (electric-pair-local-mode)
;; 			    (electric-pair-local-mode -1)))


(provide 'init-prog-mode)

;;; init-prog-mode.el ends here
