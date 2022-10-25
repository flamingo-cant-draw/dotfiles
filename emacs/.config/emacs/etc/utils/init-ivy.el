;;; init-ivy.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages
 '(ivy
   counsel
   swiper
   ivy-rich
   flyspell-correct-ivy))

(require 'ivy)
(require 'counsel)
(require 'ivy-rich)
(require 'flyspell)
(ivy-mode 1)
(diminish 'ivy-mode)
(ivy-rich-mode 1)

(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

(setq ivy-use-virtual-buffers t
      enable-recursive-minibuffers t
      ivy-count-format "(%d/%d) "
      ivy-height 7
      ivy-extra-directories '("./"))

(defun init-counsel-M-x-remove-dups ()
  "Remove the duplicate ‘^command’ from ‘counsel-M-x-history’."
  (if (and
       ;; If `counsel-M-x-history' is empty, this return nil and thus `string-match-p' errors out
       ;; making M-x unusable
       (nth 0 counsel-M-x-history)
       (string-match-p "^^" (nth 0 counsel-M-x-history)))
      (pop counsel-M-x-history)))
(advice-add #'counsel-M-x :before #'init-counsel-M-x-remove-dups)

(global-set-key "\C-s" #'swiper)
(counsel-mode 1)
(diminish 'counsel-mode)
(global-set-key (kbd "C-x b") #'counsel-switch-buffer)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-x 8 RET") #'counsel-unicode-char)
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-correct-wrapper)

(provide 'init-ivy)

;;; init-ivy.el ends here
