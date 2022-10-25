;;; init-toolbar.el ---  -*- lexical-binding: t -*-

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
;;; Code:
(require 'tool-bar)

;; redefine this so `tool-bar-add-item' can put svgs and pngs on the toolbar
;; taken from http://emacs.1067599.n8.nabble.com/SVG-PNG-images-in-toolbars-td439188.html
(defun tool-bar--image-expression (icon)
  "Return an expression that evaluates to an image spec for ICON."
  (let* ((fg (face-attribute 'tool-bar :foreground))
	 (bg (face-attribute 'tool-bar :background))
	 (colors (nconc (if (eq fg 'unspecified) nil (list :foreground fg))
			(if (eq bg 'unspecified) nil (list :background bg))))
	 (xpm-spec (list :type 'xpm :file (concat icon ".xpm")))
	 (xpm-lo-spec (list :type 'xpm :file
			    (concat "low-color/" icon ".xpm")))
	 (pbm-spec (append (list :type 'pbm :file
                                 (concat icon ".pbm")) colors))
	 (xbm-spec (append (list :type 'xbm :file
                                 (concat icon ".xbm")) colors))
	 (png-spec (append (list :type 'png :file
                                 (concat icon ".png")) colors))
         (svg-spec (append (list :type 'svg :file
                                 (concat icon ".svg")) colors)))
    `(find-image (cond ((not (display-color-p))
			',(list pbm-spec xbm-spec xpm-lo-spec xpm-spec))
		       ((< (display-color-cells) 256)
			',(list xpm-lo-spec xpm-spec pbm-spec xbm-spec))
		       (t
			',(list svg-spec png-spec xpm-spec pbm-spec xbm-spec png-spec))))))

;; load the icon directory
(add-to-list 'image-load-path (concat user-emacs-directory "etc/general/looks/icons"))

(find-image (list :type 'svg :file 'tree))

(setq tool-bar-map '(keymap
		     (nil menu-item "nil" treemacs :image
			  (find-image
			   (cond
			    ((not
			      (display-color-p))
			     '(#4=(:type pbm :file "tree.pbm" . #1=(:foreground "black" :background "grey75"))
				  #5=(:type xbm :file "tree.xbm" . #1#)
				  #2=(:type xpm :file "low-color/tree.xpm")
				  #3=(:type xpm :file "tree.xpm")))
			    (t
			     '((:type svg :file "tree.svg" . #1#)
			       #6=(:type png :file "tree.png" . #1#)
			       #3# #4# #5# #6#))))
			  :vert-only t :help "Treemacs")))

(setq isearch-tool-bar-map          tool-bar-map
      info-tool-bar-map             tool-bar-map
      compilation-mode-tool-bar-map tool-bar-map
      grep-mode-tool-bar-map        tool-bar-map)

(provide 'init-toolbar)

;;; init-toolbar.el ends here
