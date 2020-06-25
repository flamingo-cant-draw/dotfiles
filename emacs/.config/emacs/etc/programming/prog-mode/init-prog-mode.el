;;; init-prog-mode.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; Config for general programming.
;;; Code:

(install-packages '(undo-tree))

(global-visual-line-mode 1)
(global-subword-mode 1)
(global-undo-tree-mode 1)
(save-place-mode 1)

;;- Make camelCase vars easier to read
(require 'glasses)
(setq glasses-face 'bold-italic
      glasses-separator ""
      ;; if this isn't set then it `glasses-mode' messes up snake_case variables
      glasses-original-separator ""
      glasses-separate-parentheses-p nil)
(glasses-set-overlay-properties)

;;- Don't show the minor modes in modeline we don't want to know about
(diminish 'visual-line-mode)
(diminish 'subword-mode)
(diminish 'undo-tree-mode)
(diminish 'glasses-mode)

;;- Easily format whole buffer(C-h C-M-\ moves the point so is kinda awkward)
(defun init-indent-whole-buffer ()
  "`indent-region' on the whole buffer and `delete-trailing-whitespce'."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

(global-set-key (kbd "C-x C-\\") #'init-indent-whole-buffer)

;;- Make it so `M-w' and `C-w' copy/kill the current line if no region is selected
;; taken from http://emacs-fu.blogspot.com/2009/11/copying-lines-without-selecting-them.html
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-beginning-position 2)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position) (line-beginning-position 2)))))

(require 'display-line-numbers)
(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'glasses-mode)

;; the following is to get 'auto-newline' functionality
;; (Example:
;; {|} + RET --> {
;;     |
;; }).
;; Emacs' inbuilt `electric-indent-mode' only supports this when `electric-pair-mode' is active.
;; However turning `electric-pair-local-mode' on then off activates
;; this(but not `electric-pair-mode' proper for some reason).
;; This allows us to use `smartparens' while still having this nice-to-have feature without
;; playing around with post-hooks.
(add-hook 'prog-mode-hook (lambda ()
			    (electric-pair-local-mode)
			    (electric-pair-local-mode -1)))

(provide 'init-prog-mode)

;;; init-prog-mode.el ends here
