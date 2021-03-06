(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
;(package-initialize) (package-refresh-contents)
;(unless (package-installed-p 'evil) (package-install 'evil))
;(unless (package-installed-p 'neotree) (package-install 'neotree))
;(unless (package-installed-p 'use-package) (package-install 'use-package))
;(unless (package-installed-p 'flycheck) (package-install 'flycheck))
;(unless (package-installed-p 'evil-org) (package-install 'evil-org))
;(unless (package-installed-p 'auto-complete) (package-install 'auto-complete))
;(unless (package-installed-p 'dumb-jump) (package-install 'dumb-jump))
;(unless (package-installed-p 'sly) (package-install 'sly))
;(unless (package-installed-p 'geiser) (package-install 'geiser))
;(unless (package-installed-p 'geiser-racket) (package-install 'geiser-racket))

;;require packages and some defaults with the packages
;currently too lazy to spend two minutes learning use-package
(require 'evil) (evil-mode 1)
(require 'neotree) (setq neotree-smart-open t)
(require 'flycheck) (global-flycheck-mode)
(require 'auto-complete)
(require 'sly)
(require 'geiser)
(require 'geiser-racket)

(require 'dumb-jump)
(ac-config-default)
(setq ac-auto-start 4)
(define-key ac-completing-map "\r" nil)
(setq inferior-lisp-program "sbcl")
(setq scheme-program-name "racket")

;(require 'evil-org)
;(add-hook 'org-mode-hook 'evil-org-mode)
;(evil-org-set-key-theme '(navigation insert textobjects additional))

;;link to library is https://raw.githubusercontent.com/wkoszek/cweb/master/cweb.el and it should be in the load-path
;(load-library "~/.emacs.d/cweb.el")

;;convenience and sanity
(setq scroll-conservatively most-positive-fixnum)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(menu-bar-mode nil)
(show-paren-mode t)
;blaitant violation of the DRY principle, but I don't want a defun in my .emacs
(add-hook 'latex-mode-hook (lambda () (progn
					(auto-fill-mode)
					(setq truncate-lines nil)
					(setq truncate-partial-width-windows nil))))

(add-hook 'org-mode-hook (lambda () (progn
					(auto-fill-mode)
					(setq truncate-lines nil)
					(setq truncate-partial-width-windows nil))))
(modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;aesthetic changes
(set-face-attribute 'default nil :family "JetBrains Mono" :height 115)
(add-to-list 'custom-theme-load-path
	     (file-name-as-directory "C:\\Users\\biggu\\AppData\\Roaming\\.emacs.d"))
(load-theme 'railscast t t)
(enable-theme 'railscast)

;https://github.com/technomancy/better-defaults/blob/master/better-defaults.el
(unless (eq window-system 'ns)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

(setq c-basic-offset 4)


(global-set-key "\M-q" 'neotree-toggle)
(global-set-key "\M-w" 'shell-command)
(global-set-key "\M-a" (lambda () (interactive) (other-window 1)))

;;evil specific custom keybinds
(evil-define-key 'normal 'global "??" 'evil-ex);italian keyboard, too used to : placement on english keyboard
(evil-set-leader 'normal (kbd "SPC"))
(evil-set-leader 'insert (kbd "M-SPC"))
(evil-define-key 'normal 'global (kbd "<leader>q") 'neotree-toggle)
(evil-define-key 'normal 'global (kbd "<leader>w") 'shell-command)
(evil-define-key 'normal 'global (kbd "<leader>a") (lambda () (interactive) (other-window 1)))
;(evil-define-key 'normal 'global (kbd "<leader>sa") (kbd "i\\sum_{-\\infty}^{\\infty}e^{}")) fallo poi per argenti

;;absolutely I M P E R A T I V E, Alonzo Church is judging yo  u
(evil-define-key 'insert org-mode-map (kbd "TAB") 'org-cycle)
(evil-define-key 'normal 'global (kbd "<leader>vs") 'split-window-right)
(evil-define-key 'normal 'global (kbd "<leader>vh") 'split-window-below)
(evil-define-key 'normal 'global (kbd "<leader>vq") 'delete-window)
(evil-define-key 'normal 'global (kbd "<leader>vw") 'delete-other-windows)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)

(evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-create-node)
(evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
(evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-copy-node)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages '(sly slime geiser-racket geiser evil))
 '(send-mail-function 'mailclient-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
