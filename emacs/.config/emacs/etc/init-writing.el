;;; init-writing.el ---  -*- lexical-binding: t -*-

;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:
;;; Code:

(install-packages '(captain auto-correct))

(require 'captain)
(require 'org)
(require 'flyspell)

(add-hook 'text-mode-hook #'flyspell-mode)


(setq ispell-program-name "aspell")
(setq-default ispell-extra-args '("--sug-mode=ultra"
				  "--lang=en_GB"
				  "--camel-case"
				  "-H"))

;; Captain(auto-capitalisation)
(add-hook
 'org-mode-hook
 (lambda ()
   (setq captain-predicate
         (lambda () (not (org-in-src-block-p))))))

(add-hook 'text-mode-hook
          (lambda ()
	    (captain-mode)
            (setq captain-predicate (lambda () t))))

(diminish #'captain-mode "Cap")

(setq sentence-end-double-space nil)

(provide 'init-writing)

;;; init-writing.el ends here
