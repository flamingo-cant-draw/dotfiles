;;; init-prog-mode.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; Config for general programming.
;;; Code:

(install-packages '(undo-tree))

(global-visual-line-mode 1)
(global-subword-mode 1)
(global-undo-tree-mode 1)
(save-place-mode 1)
(diminish 'visual-line-mode)
(diminish 'subword-mode)
(diminish 'undo-tree-mode)

(setq-default tab-width 4)

(defun formaty ()
  "`indent-region' on the whole buffer and `delete-trailing-whitespce'."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

(global-set-key (kbd "C-x C-\\") #'formaty)

;; make it so `M-w' and `C-w' copy/kill the current line if no region is selected
;; taked from http://emacs-fu.blogspot.com/2009/11/copying-lines-without-selecting-them.html
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


(add-hook 'prog-mode-hook (lambda ()
							(display-line-numbers-mode)
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
							(electric-pair-local-mode)
							(electric-pair-local-mode -1)))

(provide 'init-prog-mode)

;;; init-prog-mode.el ends here
