;;; Add this at the top of the init.el file:
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(package-refresh-contents)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

;; (when (memq window-system '(mac ns x))
;;  (exec-path-from-shell-initialize))

;; (setq multi-term-program "/bin/bash")

(custom-set-variables
     '(term-default-bg-color "#121212")        ;; background color (black) old: 273849
     '(term-default-fg-color "#8db6cd"))       ;; foreground color (DeepSkyBlue)

;; (setq multi-term-program "/bin/bash")
;; (use-package color-theme :ensure t)
;; (load-theme 'mgl-light t)
 (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-mgl/")
 (load-theme 'bubbleberry t)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'sanityinc-tomorrow-night t)
;; (powerline-default-theme)

;; colors...
;; (defvar powerline-color1)
;; (defvar powerline-color2)

;; (setq powerline-color1 "plum3")
;; (setq powerline-color2 "plum4")

;; shape...
;; (setq powerline-arrow-shape 'arrow)   ;; the default
;;   (setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
;; (setq powerline-arrow-shape 'arrow14) ;; best for small fonts

(setq org-agenda-files '("~/mike-maheu/gtd"))
(eval-after-load "org"
  '(require 'ox-md nil t))

(set-default 'cursor-type  'hbar)

(global-set-key (kbd "<f6>") 'lawlist-bookmark)

(defun lawlist-bookmark (choice)
  "Choices for directories and files."
  (interactive "c[D]ired | [a]genda.md | [g]td.md | [m]ike.org | [n]otes")
    (cond
	   ((eq choice ?D)
	   (dired "~/Development/java"))
	   ((eq choice ?a)
	   (find-file "~/m-notes/gtd/agenda.md")
	    (message "Opened:  %s" (buffer-name)))
	  ((eq choice ?g)
	   (find-file "~/m-notes/gtd/tasks.md")
	    (message "Opened:  %s" (buffer-name)))
	  ((eq choice ?m)
	   (find-file "~/.emacs.d/mike.org")
	    (message "Opened:  %s" (buffer-name)))
	  ((eq choice ?n)
	   (dired "~/m-notes")
	    (message "Opened:  %s" (buffer-name)))
	  (t (message "Quit"))))


(require 'linum)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)

 '(display-time-mode t)
 '(org-agenda-files
   (quote
    ("~/mike-maheu/gtd/gtd.org" "~/mike-maheu/gtd/agendas.org" "~/mike-maheu/gtd/calendar.org" "~/mike-maheu/gtd/journal.org" "~/mike-maheu/gtd/mike.org" "~/mike-maheu/gtd/notes.org" "~/mike-maheu/gtd/plangtd.org" "~/mike-maheu/gtd/reminders.org" "~/mike-maheu/gtd/shopping.org" "~/mike-maheu/gtd/someday.org")))
 '(remember-data-file "~/mike-maheu/gtd/reminders.org")
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;;; Global key bindigns

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

;; Window manipulation
(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)

;; Find stuff
(global-set-key [(f2)]              'ack)
(global-set-key [(control f2)]      'ack-same)
(global-set-key [(control meta f2)] 'ack-default-directory)
(global-set-key [(meta f2)]         'find-name-dired)
(global-set-key [(shift f2)]        'occur)

;; Keyboard macros
(global-set-key [(shift f4)] 'kmacro-start-macro-or-insert-counter)
;; (global-set-key [(f4)]    'kmacro-end-or-call-macro)  ;; already defined

;; Refresh-like
(global-set-key [(f5)]         'revert-buffer)
(global-set-key [(control f5)] 'revbufs)

;; Indenting and alignment
(global-set-key [(f8)]         'indent-region)
(global-set-key [(control f8)] 'align)
(global-set-key [(shift f8)]   'align-current)
(global-set-key [(meta f8)]    'align-regexp)

;; Version control and change related
;(global-set-key [(control f9)]      'rails-svn-status-into-root)  ;; Move to rails mode?
;(global-set-key [(control meta f9)] (lambda () (interactive) (svn-status default-directory)))
(global-set-key [(control f9)] (lambda () (interactive) (magit-status default-directory)))
(global-set-key [(f9)]         (lambda () (interactive) (magit-status default-directory)))
(global-set-key [(meta f9)]    'autotest-switch)  ;; Move to ruby/rails mode?

;; map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap

;; Rinari Mappings (may add more later, but these are the main ones I need)
(global-set-key (kbd "C-c f c") 'rinari-find-controller)
(global-set-key (kbd "C-c f m") 'rinari-find-model)
(global-set-key (kbd "C-c f v") 'rinari-find-view)


(global-set-key (kbd "M-O") 'rotate-windows)

;; Ace Jump Mode
(global-set-key (kbd "M-j") 'ace-jump-mode)

;; Help for markdown-mode
(setq markdown-enable-prefix-prompts t)

;; Multiple Cursors
(define-key global-map (kbd "C-c n") 'mc/mark-all-like-this)
(define-key global-map (kbd "M-n") 'mc/mark-next-lines)

;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window
;; To help Unlearn C-x 0, 1, 2, o
(global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
(global-unset-key (kbd "C-x 2")) ; was split-window-vertically
(global-unset-key (kbd "C-x 1")) ; was delete-other-windows
(global-unset-key (kbd "C-x 0")) ; was delete-window
(global-unset-key (kbd "C-x o")) ; was other-window

;; Open magit git status easier
(global-set-key (kbd "C-c g") 'magit-status) ;

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Window navigation
(windmove-default-keybindings 'meta)

;; Mac OS X conventions
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; Easy inserts
(global-set-key (kbd "C-.") 'insert-arrow)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Easier buffer killing
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-K") 'kill-this-buffer)

;; Improved navigation and editing (assumes misc.el)
(global-set-key (kbd "M-Z") 'zap-up-to-char)
(global-set-key (kbd "M-F") 'forward-to-word)
(global-set-key (kbd "M-B") 'backward-to-word)


;; Tags
(global-set-key (kbd "M-,") 'pop-tag-mark) ; was tags-loop-continue

;; Goto Line
;; (global-set-key [remap goto-line] 'goto-line-with-feedback)

;; Whitespace management
(global-set-key (kbd "s-\\") 'fixup-whitespace)

;;; Generic emacs settings I cannot live without

;; Use command as the meta key; option key as super
(setq ns-command-modifier 'meta)
(setq ns-option-modifier  'super)

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)
(pending-delete-mode t)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Modeline info
(display-time-mode 1)
;; (display-battery-mode 1)

;; Small fringes
(set-fringe-mode '(1 . 1))

;; Emacs gurus don't need no stinking scroll bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; Line-wrapping
(set-default 'fill-column 78)

;; Prevent the annoying beep on errors
;; (setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Gotta see matching parens
(show-paren-mode t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; For emacsclient
(server-start)

;; Trailing whitespace is unnecessary
(defvar whitespace-cleanup-on-save t)
;; (setq whitespace-cleanup-on-save nil)
(add-hook 'before-save-hook
	  (lambda ()
	    (if whitespace-cleanup-on-save (whitespace-cleanup))))

;; Trash can support
(setq delete-by-moving-to-trash t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
	  helm-input-idle-delay 0.01  ; this actually updates things
					; reeeelatively quickly.
	  helm-yas-display-key-on-candidate t
	  helm-quick-update t
	  helm-M-x-requires-pattern nil
	  helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
	 ("C-h a" . helm-apropos)
	 ("C-x C-b" . helm-buffers-list)
	 ("C-x b" . helm-buffers-list)
	 ("M-y" . helm-show-kill-ring)
	 ("M-x" . helm-M-x)
	 ("C-x c o" . helm-occur)
	 ("C-x c s" . helm-swoop)
	 ("C-x c y" . helm-yas-complete)
	 ("C-x c Y" . helm-yas-create-snippet-on-region)
	 ("C-x c b" . my/helm-do-grep-book-notes)
	 ("C-x c SPC" . helm-all-mark-rings)))
(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

(setq org-modules '(org-bbdb
		      org-gnus
		      org-drill
		      org-info
		      org-jsinfo
		      org-habit
		      org-irc
		      org-mouse
		      org-protocol
		      org-annotate-file
		      org-eval
		      org-expiry
		      org-interactive-query
		      org-man
		      org-collector
		      org-panel
		      org-screen
		      org-toc))
(eval-after-load 'org
 '(org-load-modules-maybe t))

(setq org-expiry-inactive-timestamps t)
(bind-key "C-c r" 'org-capture)
(bind-key "C-c a" 'org-agenda)
(bind-key "C-c l" 'org-store-link)
(bind-key "C-c L" 'org-insert-link-global)
(bind-key "C-c O" 'org-open-at-point-global)
(bind-key "C-TAB" 'org-cycle org-mode-map)
(bind-key "C-c v" 'org-show-todo-tree org-mode-map)
(bind-key "C-c C-r" 'org-refile org-mode-map)
(bind-key "C-c R" 'org-reveal org-mode-map)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/mike-maheu/gtd/gtd.org" "Inbox")
	 "* TODO %?\n  %i\n  %a")
	("j" "Journal" entry (file+datetree "~/mike-maheu/gtd/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

(setq eshell-prompt-function
     (lambda ()
       (concat
	(propertize "┌─[" 'face `(:foreground "cyan"))
	(propertize (concat (eshell/pwd)) 'face `(:foreground "white"))
	(propertize "@" 'face `(:foreground "cyan"))
	(propertize "]──[" 'face `(:foreground "cyan"))
	(propertize (format-time-string "%H:%M" (current-time)) 'face `(:foreground "aero"))
	(propertize "]\n" 'face `(:foreground "cyan"))
	(propertize "└─>" 'face `(:foreground "cyan"))
	(propertize (if (= (user-uid) 0) " # " " $ ") 'face `(:foreground "cyan"))
	)))