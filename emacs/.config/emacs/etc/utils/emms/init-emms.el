;;; init-emms.el --- control music from within emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(unless (file-directory-p (concat init-site-lisp-path "emms-5.4/"))
  (shell-command (concat "wget -qO- ftp://ftp.gnu.org/gnu/emms/emms-5.4.tar.gz | tar -zxvf - -C "
						 user-emacs-directory
						 "var/site-lisp/")))

(require 'emms-setup)
(require 'emms-player-mpd)
(require 'mpc)
(emms-all)

(setq emms-player-list '(emms-player-mpd)
	  emms-info-functions '(emms-info-mpd)
	  emms-player-mpd-server-name "localhost"
	  emms-player-mpd-server-port "6600"
	  mpc-host "localhost:6600")

(global-set-key (kbd "C-c m c") #'emms-player-mpd-connect)
(global-set-key (kbd "C-c m p") #'emms-player-mpd-pause)
(global-set-key (kbd "C-c m r") #'emms-player-mpd-update-all-reset-cache)
(global-set-key (kbd "C-c m b") #'emms-smart-browse)

(provide 'init-emms)

;;; init-emms.el ends here
