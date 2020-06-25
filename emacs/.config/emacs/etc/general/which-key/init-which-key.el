;;; init-which-key.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(install-packages '(which-key))


(require 'which-key)

;; `which-key' is a package that shows the current shortcuts
;; avaliable from a given prefix
(which-key-mode 1)

(setq which-key-idle-delay 0.5
	  which-key-popup-type 'side-window
	  which-key-side-window-location 'bottom)

(which-key-add-key-based-replacements
  "C-c m" "emms-mpd"

;;-- C-x commands
  ;;- utf8 insert(C-x 8)
  "C-x 8" "utf8-insert"
  "C-x 8 \"" "insert-diaeresis"
  "C-x 8 '" "insert-acute"
  "C-x 8 `" "insert-grave"
  "C-x 8 ^" "insert-circumflex"
  "C-x 8 ~" "insert-tilde"
  "C-x 8 _" "insert-underbar"
  "C-x 8 ," "insert-cedilla"
  "C-x 8 /" "insert-danish"
  "C-x 8 *" "insert-special"
  "C-x 8 a" "insert-arrow"

  "C-x 8 1" "insert-fraction/cross"
  "C-x 8 1 /" "insert-fraction"
  "C-x 8 1 -" "‡"
  "C-x 8 1 / 3" "¾"
  ;;- end utf8 insert

  "C-x n" "narrow"
  "C-x a" "abbrev"
  "C-x @" "apply-modifier"
  "C-x RET" "set-input-system"
  "C-x ESC" "repeat-complex-command"
;;-- end C-x commands

;;-- C-c commands
  "C-c !" "flycheck"
  "C-c &" "yas"
  "C-c t" "treemacs"
;;-- end C-c commands
  )

(diminish 'which-key-mode)

(provide 'init-which-key)

;;; init-which-key.el ends here
