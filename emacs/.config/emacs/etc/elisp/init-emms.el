;;; init-emms.el --- control music from within emacs -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(install-packages '(emms))

(require 'emms-setup)
(emms-all)

(setq emms-player-list '(emms-player-vlc emms-player-vlc-playlist emms-player-mpg321 emms-player-ogg123 emms-player-mplayer emms-player-mplayer-playlist))
(setq emms-source-file-default-directory "~/Music/")

(provide 'init-emms)

;;; init-emms.el ends here
