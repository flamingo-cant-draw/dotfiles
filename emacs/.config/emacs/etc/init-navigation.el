;;; init-navigation.el ---  -*- lexical-binding: t -*-

;; Author: Veronica
;; Maintainer: Veronica
;; Version: 0.1
;; Package-Requires: ()

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

(install-packages
 '(avy
   ace-window))

(require 'bookmark)

(global-set-key (kbd "M-o") 'ace-window)

(defun bookmark-jump-find-file ()
  "`bookmark-jump' but go to file with `find-file'."
  (interactive)
  (find-file
   (bookmark-get-filename (completing-read "Select bookmark: " (bookmark-all-names)))))

;; (define-key ctl-x-r-map (kbd "b") #'bookmark-jump-find-file)

(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(provide 'init-navigation)

;;; init-navigation.el ends here
