;;; vibin-theme.el --- -*- lexical-binding: t -*-

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
;; We be vibin bois!
;;; Code:

(defgroup vibin-theme nil
  "Vibrant theme to match any vibe!"
  :group 'faces
  :prefix "vibin-")

(deftheme vibin "Vibrant theme to match any vibe!")

(let ((bg-normal "#1d252c") (bg-dark "#181e24")
      (bg-select "#31353c") (bg-dim "#292e33")
      (fg-normal "#eee") (fg-dark "#888")
      ;; IDK if any of these are right
      (fg-red "#e86357") (fg-green "#87ae4c")
      (fg-cyan "#54c8e4") (fg-purple "#898bd1")
      (fg-yellow "#73f573") (fg-blue "#5786d6")
      (fg-turq "#21bfa4"))
  (custom-theme-set-faces
   'vibin

   ;; General
   `(default                          ((t :background ,bg-normal :foreground ,fg-normal)))
   `(cursor                           ((t :background ,fg-normal)))
   `(error                            ((t :foreground ,fg-red :weight bold)))
   `(font-lock-comment-face           ((t :foreground ,fg-dark :slant italic)))
   `(font-lock-comment-delimiter-face ((t :foreground ,fg-dark)))
   `(font-lock-variable-name-face     ((t :foreground ,fg-green)))
   `(font-lock-type-face              ((t :foreground ,fg-yellow)))
   `(font-lock-constant-face          ((t :foreground ,fg-turq)))
   `(font-lock-function-name-face     ((t :foreground ,fg-cyan)))
   `(font-lock-doc-face               ((t :foreground ,fg-turq :inherit default)))
   `(font-lock-builtin-face           ((t :foreground ,fg-blue)))
   `(font-lock-keyword-face           ((t :foreground ,fg-purple)))
   `(font-lock-negation-char-face     ((t :foreground ,fg-cyan :weight bold)))
   `(font-lock-string-face            ((t :foreground ,fg-red :slant italic)))
   `(fringe                           ((t :background ,bg-dark)))
   `(region                           ((t :background ,bg-select :weight bold)))
   `(shadow                           ((t :background ,bg-dark)))
   `(success                          ((t :foreground ,fg-green :weight bold)))
   `(highlight                        ((t :background ,bg-select)))
   `(vertical-border                  ((t :background ,bg-dark :foreground ,bg-dark)))

   ;; Show paren
   `(show-paren-match    ((t :foreground ,fg-yellow :weight bold :inverse-video nil)))
   `(show-paren-mismatch ((t :foreground ,fg-normal :background ,fg-red :weight extra-bold :inverse-video nil)))

   ;; line numbers
   `(line-number              ((t :background ,bg-dark :foreground ,fg-dark)))
   `(line-number-current-line ((t :foreground ,fg-turq :background ,bg-dark)))

   ;; company
   `(company-echo-common              ((t :foreground ,fg-red)))
   `(company-prefix                   ((t :background ,bg-select :foreground ,fg-green)))
   `(company-preview-common           ((t :background ,bg-select :foreground ,fg-yellow :weight bold)))
   `(company-tooltip                  ((t :background ,bg-dark :foreground ,fg-normal)))
   `(company-tooltip-annotation       ((t :foreground ,fg-blue)))
   `(company-tooltip-common           ((t :foreground ,fg-blue :slant italic)))
   `(company-tooltip-search           ((t :foreground ,fg-yellow)))
   `(company-tooltip-search-selection ((t :background ,bg-select)))
   `(company-tooltip-selection        ((t :background ,bg-select)))
   `(company-scrollbar-bg             ((t :background ,bg-dark)))
   `(company-scrollbar-fg             ((t :background ,bg-select)))

   ;; window divider
   `(window-divider             ((t :foreground ,bg-dark)))
   `(window-divider-first-pixel ((t :foreground unspecified :inherit window-divider)))
   `(window-divider-last-pixel  ((t :foreground unspecified :inherit window-divider)))

   ;; modeline
   `(mode-line           ((t :background ,bg-dark :foreground ,fg-normal)))
   `(mode-line-inactive  ((t :background ,bg-dim :foreground ,fg-dark)))
   `(mode-line-highlight ((t :foreground ,fg-blue)))
   `(mode-line-buffer-id ((t :widget bold :foreground ,fg-cyan)))

   `(header-line       ((t :background ,bg-dark :foreground ,fg-normal)))
   `(minibuffer-prompt ((t :background ,bg-normal :foreground ,fg-yellow)))

   ;; ivy
   `(ivy-confirm-face            ((t :foreground ,fg-cyan)))
   `(ivy-current-match           ((t :foreground nil :background ,bg-dark :weight bold)))
   `(ivy-cursor                  ((t :foreground ,fg-normal)))
   `(ivy-highlight-face          ((t :background nil :foreground ,fg-green)))
   `(ivy-match-required-face     ((t :foreground ,fg-red)))
   `(ivy-modified-buffer         ((t :foreground ,fg-green)))
   `(ivy-minibuffer-match-face-1 ((t :background nil :foreground ,fg-dark
				     :slant italic)))
   `(ivy-minibuffer-match-face-2 ((t :background nil :foreground ,fg-yellow
				     :slant italic :underline t)))
   `(ivy-minibuffer-match-face-3 ((t :background nil :foreground ,fg-green
				     :slant italic :underline t)))
   `(ivy-minibuffer-match-face-4 ((t :background nil :foreground ,fg-blue
				     :slant italic :underline t)))
   `(ivy-remote                  ((t :foreground ,fg-green)))
   `(ivy-subdir                  ((t :foreground ,fg-blue :slant italic)))
   `(ivy-virtual                 ((t :foreground ,fg-turq)))

   ;; counsel
   `(counsel-key-binding ((t :foreground ,fg-blue)))

   ;; swiper
   `(swiper-match-face-1 ((t :background ,bg-select :foreground ,fg-dark
			     :slant italic)))
   `(swiper-match-face-2 ((t :background ,bg-select :foreground ,fg-yellow
			     :slant italic)))
   `(swiper-match-face-3 ((t :background ,bg-select :foreground ,fg-green
			     :slant italic)))
   `(swiper-match-face-4 ((t :background ,bg-select :foreground ,fg-blue
			     :slant italic)))

   ;; cperl
   `(cperl-array-face ((t :foreground ,fg-green :weight bold)))
   `(cperl-hash-face ((t :foreground ,fg-green :slant italic)))

   ;; auto-dim
   `(auto-dim-other-buffers-face ((t :background ,bg-dark :foreground ,fg-dark)))

   `(hl-line ((t :background ,bg-dark)))))

(provide-theme 'vibin)

;;; vibin-theme.el ends here
