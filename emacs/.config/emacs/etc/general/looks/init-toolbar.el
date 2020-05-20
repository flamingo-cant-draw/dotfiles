;;; init-toolbar.el ---  -*- lexical-binding: t -*-
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

(setq tool-bar-map (make-sparse-keymap))
(setq isearch-tool-bar-map (make-sparse-keymap))

;; load the icon directory
(add-to-list 'image-load-path (concat user-emacs-directory "etc/general/looks/icons"))

(tool-bar-add-item "tree"
				   (lambda () (interactive) (message "hello"))
				   nil
				   :label "Say Hello"
				   :vert-only t
				   :help "Say Hello")

(provide 'init-toolbar)

;;; init-toolbar.el ends here
