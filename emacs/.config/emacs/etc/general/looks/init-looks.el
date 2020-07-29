;;; init-looks.el ---  -*- lexical-binding: t -*-

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

(install-packages '(all-the-icons
		    highlight-numbers
		    highlight-indent-guides
		    hl-todo		 ; highlight todo, fixme etc. comments
		    auto-dim-other-buffers
		    ))

(add-to-list 'custom-theme-load-path
	     (concat user-emacs-directory "etc/general/looks/"))

(load-theme 'vibin t)
(set-frame-parameter (selected-frame) 'alpha 98)

(set-frame-font "Mononoki 12" nil t)
;; emoji support, requires noto emoji font to be installed
(set-fontset-font t 'unicode (font-spec :name "Noto Color Emoji") nil 'append)

(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'character
      highlight-indent-guides-responsive 'stack)

;; get rid of ugly bars at the sides of the windows but keep the left one for prog-mode
(fringe-mode 0)
(add-hook 'prog-mode-hook (lambda () (setq-local left-fringe-width 8)))

(auto-dim-other-buffers-mode 1)

(diminish #'highlight-indent-guides-mode)

(add-hook 'prog-mode-hook #'highlight-numbers-mode)
(add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
(add-hook 'prog-mode-hook #'hl-todo-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)

(add-hook 'text-mode-hook #'hl-line-mode)

(provide 'init-looks)

;;; init-looks.el ends here
