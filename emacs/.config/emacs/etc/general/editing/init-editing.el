;;; init-editing.el ---  -*- lexical-binding: t -*-
;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; General editing configuration

;; History:
;; Swapped the advised copy/kill region from
;; http://emacs-fu.blogspot.com/2009/11/copying-lines-without-selecting-them.html
;; and instead use Purcell's whole-region-or-line

;;; Code:




(install-packages '(whole-line-or-region
		    undo-tree))

;; Active some quality of life modes
(global-visual-line-mode 1) 		; Moves word splits onto the next line
(global-undo-tree-mode 1)
(save-place-mode 1)			; Remember where we where in a file


;; Make it so `M-w' and `C-w' copy/kill the current line if no region is selected
(setq whole-line-or-region-local-mode-map ; redefine this to avoid comment-dwin getting remapped
      (let ((map (make-sparse-keymap)))
	(define-key map [remap kill-region] 'whole-line-or-region-kill-region)
	(define-key map [remap kill-ring-save] 'whole-line-or-region-kill-ring-save)
	(define-key map [remap copy-region-as-kill] 'whole-line-or-region-copy-region-as-kill)
	(define-key map [remap delete-region] 'whole-line-or-region-delete-region)
	;; (define-key map [remap comment-dwim] 'whole-line-or-region-comment-dwim-2)
	(define-key map [remap comment-region] 'whole-line-or-region-comment-region)
	(define-key map [remap uncomment-region] 'whole-line-or-region-uncomment-region)
	(define-key map [remap indent-rigidly-left-to-tab-stop] 'whole-line-or-region-indent-rigidly-left-to-tab-stop)
	(define-key map [remap indent-rigidly-right-to-tab-stop] 'whole-line-or-region-indent-rigidly-right-to-tab-stop)
	(define-key map [remap indent-rigidly-left] 'whole-line-or-region-indent-rigidly-left)
	(define-key map [remap indent-rigidly-right] 'whole-line-or-region-indent-rigidly-right)
	map))
(whole-line-or-region-global-mode 1)

(defun init-multi-yank (amount)
  "Pastes the first item in the kill ring an AMOUNT of times."
  (interactive "p")
  (dotimes (_ amount)
    (yank)))
(global-set-key (kbd "C-M-y") #'init-multi-yank)

(provide 'init-editing)

;;; init-editing.el ends here
