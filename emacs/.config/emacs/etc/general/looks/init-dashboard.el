;;; init-dashboard.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(dashboard))

(require 'dashboard)
(dashboard-setup-startup-hook)

(defun random-image ()
  "Select a random image to be the header of the dashboard."
  (let* ((files (directory-files "~/Pictures/memes" nil "\\.png\\'"))
		 (index (random (length files))))
    (concat "~/Pictures/memes/" (nth index files))))

(setq dashboard-set-heading-icons t
      dashboard-set-file-icons    t
      dashboard-center-content    t
      ;; dashboard-startup-banner    (random-image)
      )

(provide 'init-dashboard)

;;; init-dashboard.el ends here
