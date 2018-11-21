(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(global-linum-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(display-time-mode 1)
(display-battery-mode 1)
(setq column-number-mode 1)
(global-hl-line-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(savehist-mode 1)
(global-auto-revert-mode 1)
(global-visual-line-mode 1)

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filname-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extension-order '(".org" ".txt" ".csv"))

(ido-grid-mode 1)

(require 'cl)
(setq cycle-themes-theme-list
'(exotica dracula))
(require 'cycle-themes)
(cycle-themes-mode)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(global-set-key (kbd "C-?") 'hippie-expand)
(global-set-key (kbd "C-z") 'replace-string)
(global-set-key (kbd "C-M-z") 'replace-regex)
(global-set-key (kbd "C-Z") 'count-matches)

(load-theme 'exotica t)
