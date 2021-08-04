(setq user-full-name "Mike Maheu"
      user-mail-address "mike@codemartians.com")

(set-default 'cursor-type  'hbar)

;; Load the rest of the packages
(package-initialize nil)
(setq package-enable-at-startup nil)
(org-babel-load-file "~/.emacs.d/mike.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(org-agenda-files '("~/mike-maheu/gtd/gtd.org"))
 '(package-selected-packages
   '(mpdmacs emms-info-mediainfo org-re-reveal-ref org-re-reveal zenburn-theme white-sand-theme uuidgen use-package undo-tree todotxt tango-2-theme rinari railscasts-theme powerline multiple-cursors multi-term markdown-preview-mode magit-popup magit jekyll-modes jdee htmlize helm groovy-mode exec-path-from-shell dimmer diminish dakrone-light-theme color-theme-solarized color-theme-sanityinc-tomorrow auto-package-update atom-dark-theme ace-jump-mode))
 '(remember-data-file "~/Dropbox/m-notes/org/reminders.org")
 '(show-paren-mode t)
 '(term-default-bg-color "#222222")
 '(term-default-fg-color "#8db6cd")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "grey" :foreground "black")))))
