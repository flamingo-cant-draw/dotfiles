;;; init-emms.el --- control music from within emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; intall emms if it's not already installed
;; emms added to elpa
;; (unless (file-directory-p (concat init-site-lisp-path "emms-5.4/"))
;;   (shell-command (concat "wget -qO- ftp://ftp.gnu.org/gnu/emms/emms-5.4.tar.gz | tar -zxvf - -C "
;; 			 user-emacs-directory
;; 			 "var/site-lisp/")))
;; (add-to-list 'load-path (concat user-emacs-directory "var/site-lisp/emms-5.4"))

(install-packages '(emms))

(require 'emms-setup)
(require 'emms-player-mpd)
(require 'emms-playlist-mode)
(emms-all)

(setq emms-player-list '(emms-player-mpd emms-player-vlc)
      emms-info-functions '(emms-info-mpd)
      emms-player-mpd-server-name "localhost"
      emms-player-mpd-server-port "6600"
      emms-player-mpd-music-directory "~/Music"
      emms-player-mpd-sync-playlist t)

(global-set-key
 (kbd "C-c m c")
 (lambda ()
   (interactive)
   (emms-player-mpd-connect)
   (emms-cache-set-from-mpd-all)))

(add-to-list 'emms-info-functions 'emms-info-mpd)

(global-set-key (kbd "C-c m p") #'emms-player-mpd-pause)
(global-set-key (kbd "C-c m r") #'emms-player-mpd-update-all-reset-cache)
(global-set-key (kbd "C-c m b") #'emms-smart-browse)

(define-key emms-playlist-mode-map (kbd "B")
  (lambda () (interactive) (emms-seek-to 0)))

(provide 'init-emms)

;;; init-emms.el ends here
