;;; init-frame-title.el ---  -*- lexical-binding: t -*-

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
;; set the frame title based on the buffer we are in.
;;; Code:

(require 'cl-lib)
(defun init-set-title-based-on-buffer (&optional func &rest args)
  "Function to set the frame title based on buffer we are in.
FUNC is an optional function to advise, ARGS is FUNC's arguments."
  (when func (apply func args))

  (let ((buffer-name (buffer-name)))
    ;; macro to reduce having to write out the whole cond statment ourselves
    (cl-flet ((file-name-title (title &rest check-extensions)
			       `((string-match-p (string-join '(,@check-extensions) "\\|")
						 ,buffer-name)
				 (setq frame-title-format (concat ,title " - Emacs")))))
      (let ((conditionals
	     (list
	      (file-name-title "Ahh, elisp" "\\.el$")
	      (file-name-title "🦀🦀🦀 GC is gone 🦀🦀🦀" "\\.rs$")
	      (file-name-title "The original camel themed language" "\\.perl$" "\\.pm$")
	      (file-name-title "Classy" "\\.java$")
	      (file-name-title "Pottery has never been this easy" "\\.raku$" "\\.rakumod$")
	      (file-name-title "The only gem I need is you ;)" "\\.rb$" "Gemfile")
	      (file-name-title "C-ing is the easiest way to know what you're doing" "\\\.c$")
	      (file-name-title "Getting ahead?" "\\.h$")
	      (file-name-title "Stylish" "\\.css$" "\\.scss$" "\\.sass$")
	      (file-name-title "<tag>You're it</tag>" "\\.html$")
	      (file-name-title "Oh god, oh fuck\\." "\\.js$" "\\.mjs$")
	      (file-name-title "Treemacs" "Treemacs")
	      '(t (setq frame-title-format '("%b - Emacs"))))))
	(eval `(cond ,@conditionals))))))

;; Hook `init-set-title-based-on-buffer' to all the commands that change buffer
(advice-add #'other-window                  :around #'init-set-title-based-on-buffer)
(advice-add #'counsel-switch-buffer         :around #'init-set-title-based-on-buffer)
(advice-add #'find-file                     :around #'init-set-title-based-on-buffer)
(advice-add #'previous-buffer               :around #'init-set-title-based-on-buffer)
(advice-add #'next-buffer                   :around #'init-set-title-based-on-buffer)
(advice-add #'quit-window                   :around #'init-set-title-based-on-buffer)
(advice-add #'treemacs                      :around #'init-set-title-based-on-buffer)
(advice-add #'Buffer-menu-this-window       :around #'init-set-title-based-on-buffer)
(advice-add #'ace-window                    :around #'init-set-title-based-on-buffer)

(provide 'init-frame-title)

;;; init-frame-title.el ends here
