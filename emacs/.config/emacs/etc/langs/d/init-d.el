;;; init-d.el --- d-land programming setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(d-mode))

(require 'd-mode)

(defvar quiet-d t
  "Run `dub run' with the `--quiet' flag.")

(add-hook 'd-mode-hook (lambda ()
						 (setq-local indent-tabs-mode t
									 c-basic-offset 4)))

(defun run-d ()
  "Run `dub run' from within Emacs."
  (interactive)
  (let ((default-directory (locate-dominating-file (buffer-file-name) "dub.json")))
    (if quiet-d
	(compile "dub run -q")
      (compile "dub run"))))


;; use the same run command as in `cargo-minor-mode' as
;; it's one less command to remember
(define-key d-mode-map (kbd "C-c C-c C-r") #'run-d)

(provide 'init-d)

;;; init-d.el ends here
