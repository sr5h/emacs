(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq user-mail-address "sr5v@icloud.com")
(setq user-full-name "sro")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq scroll-step            1
      scroll-conservatively  10000)

(set-face-attribute 'default nil :height 120 :family "Source Code Pro")

(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(global-linum-mode 1)
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

(defalias 'yes-or-no-p 'y-or-n-p)
(display-time-mode 1)
(display-battery-mode 1)
(setq column-number-mode 1)
(global-hl-line-mode 1)
(show-paren-mode 1)
(savehist-mode 1)
(global-auto-revert-mode nil)
(global-visual-line-mode 1)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))
;; (add-to-list 'default-frame-alist '(alpha . (100 . 100)))

(add-to-list 'default-frame-alist '(foreground-color . "gray"))
(add-to-list 'default-frame-alist '(background-color . "black")) (add-to-list 'default-frame-alist '(cursor-color . "red3"))

(global-set-key (kbd "<f12>") 'other-frame)

(global-unset-key (kbd "C-/"))

(setq-default truncate-lines t)

()

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filname-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extension-order '(".org" ".txt" ".csv"))

(winner-mode 1)

(windmove-default-keybindings '(control meta))

(setq ispell-program-name "aspell")
(add-hook 'lisp-mode-hook (lambda () (flyspell-mode)))
(add-hook 'text-mode-hook (lambda () (flyspell-mode)))
(global-set-key (kbd "<f8>") 'ispell-word)
;; (global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)

(ido-grid-mode 1)

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

(require 'magit)

(pdf-tools-install)

                      
(add-hook 'pdf-view-mode-hook (lambda ()
                                 (pdf-view-midnight-minor-mode)))
(setq pdf-view-midnight-colors '("gray" . "black" ))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(add-hook 'inferior-lisp-mode-hook
    (lambda () (inferior-slime-mode t)))

(setq elfeed-feeds
      '("http://planet.lisp.org/rss20.xml"
        "http://planet.emacsen.org/atom.xml"
        "https://old.reddit.com/r/lisp/.rss?format=xml"
        "http://lispblog.xach.com/rss"))

(elpy-enable)
(let ((path (shell-command-to-string "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
  (setenv "PATH" path)
  (setq exec-path (split-string path path-separator)))

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-?") 'hippie-expand)
(global-set-key (kbd "C-z") 'replace-string)
(global-set-key (kbd "C-M-z") 'replace-regexp)
(global-set-key (kbd "C-Z") 'count-matches)
