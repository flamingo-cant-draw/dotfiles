;;; init-emms.el --- control music from within emacs -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(emms))

(require 'emms-setup)
(require 'emms-player-mpd)
(require 'mpc)
(emms-all)

;; (setq emms-player-list '(emms-player-vlc emms-player-vlc-playlist emms-player-mpg321 emms-player-ogg123 emms-player-mplayer emms-player-mplayer-playlist))
(setq emms-player-list '(emms-player-mpd))
(setq emms-info-functions '(emms-info-mpd))
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port "6600")
(setq mpc-host "localhost:6600")

(global-set-key (kbd "C-c m c") #'emms-player-mpd-connect)
(global-set-key (kbd "C-c m p") #'emms)
(global-set-key (kbd "C-c m r") #'emms-player-mpd-update-all-reset-cache)
(global-set-key (kbd "C-c m b") #'emms-smart-browse)

(provide 'init-emms)

;;; init-emms.el ends here
