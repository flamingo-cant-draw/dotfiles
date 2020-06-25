;;; init-dashboard.el ---  -*- lexical-binding: t -*-

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

(install-packages '(dashboard))

(require 'dashboard)
(dashboard-setup-startup-hook)

(defun init-dash-random-image (directory)
  "Select a random image to be the header of the dashboard.
DIRECTORY is the path to an image directory."
  (let* ((files (directory-files directory))
	 (index (random (length files))))
    (concat directory (nth index files))))

(setq dashboard-set-heading-icons t
      dashboard-set-file-icons    t
      dashboard-center-content    t
      ;; dashboard-startup-banner    (random-image)
      )

(provide 'init-dashboard)

;;; init-dashboard.el ends here
