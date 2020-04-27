;;; init-company.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(company
					company-box
					company-dcd			; d-lang auto-complete
					company-posframe))

(require 'company)
(require 'company-box)

(setq company-minimum-prefix-length 1	; show company after one char
      company-tooltip-align-annotations t
      company-show-numbers t)

;; use all-the-icons for company-box icons
;; this means icons will scale properly
;; taken from https://github.com/MatthewZMD/.emacs.d#company-box
(setq company-box-icons-all-the-icons
      `((Unknown . ,(all-the-icons-material "find_in_page" :height 0.85 :v-adjust -0.2))
        (Text . ,(all-the-icons-faicon "text-width" :height 0.8 :v-adjust -0.05))
        (Method . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
        (Function . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
        (Constructor . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
        (Field . ,(all-the-icons-octicon "tag" :height 0.8 :v-adjust 0 :face 'all-the-icons-lblue))
        (Variable . ,(all-the-icons-octicon "tag" :height 0.8 :v-adjust 0 :face 'all-the-icons-lblue))
        (Class . ,(all-the-icons-material "settings_input_component" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
        (Interface . ,(all-the-icons-material "share" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
        (Module . ,(all-the-icons-material "view_module" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
        (Property . ,(all-the-icons-faicon "wrench" :height 0.8 :v-adjust -0.05))
        (Unit . ,(all-the-icons-material "settings_system_daydream" :height 0.85 :v-adjust -0.2))
        (Value . ,(all-the-icons-material "format_align_right" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
        (Enum . ,(all-the-icons-material "storage" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
        (Keyword . ,(all-the-icons-material "filter_center_focus" :height 0.85 :v-adjust -0.2))
        (Snippet . ,(all-the-icons-material "format_align_center" :height 0.85 :v-adjust -0.2))
        (Color . ,(all-the-icons-material "palette" :height 0.85 :v-adjust -0.2))
        (File . ,(all-the-icons-faicon "file-o" :height 0.85 :v-adjust -0.05))
        (Reference . ,(all-the-icons-material "collections_bookmark" :height 0.85 :v-adjust -0.2))
        (Folder . ,(all-the-icons-faicon "folder-open" :height 0.85 :v-adjust -0.05))
        (EnumMember . ,(all-the-icons-material "format_align_right" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
        (Constant . ,(all-the-icons-faicon "square-o" :height 0.85 :v-adjust -0.05))
        (Struct . ,(all-the-icons-material "settings_input_component" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
        (Event . ,(all-the-icons-faicon "bolt" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-orange))
        (Operator . ,(all-the-icons-material "control_point" :height 0.85 :v-adjust -0.2))
        (TypeParameter . ,(all-the-icons-faicon "arrows" :height 0.8 :v-adjust -0.05))
        (Template . ,(all-the-icons-material "format_align_center" :height 0.85 :v-adjust -0.2)))
      company-box-icons-alist 'company-box-icons-all-the-icons)


(let ((modes '(prog-mode-hook sly-mrepl-hook conf-mode)))
  (dolist (mode modes)
	(add-hook mode 'company-mode)))

(add-hook 'company-mode-hook 'company-box-mode)

(diminish 'company-mode)
(diminish 'company-box-mode)

(provide 'init-company)

;;; init-company.el ends here
