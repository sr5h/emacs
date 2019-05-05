(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq user-mail-address "sr5v@icloud.com")
(setq user-full-name "sro")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq scroll-step            1
      scroll-conservatively  10000)

(set-face-attribute 'default nil :height 130 :family "Fixed")

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

(add-to-list 'default-frame-alist '(alpha . (85 . 85)))
(add-to-list 'default-frame-alist '(width . 95))
(add-to-list 'default-frame-alist '(height . 60))
    
  
(add-to-list 'default-frame-alist '(foreground-color . "#ffe97a"))
(add-to-list 'default-frame-alist '(background-color . "#002b00")) 
(add-to-list 'default-frame-alist '(cursor-color . "red3"))

(global-set-key (kbd "<f11>") 'ns-prev-frame)
(global-set-key (kbd "<f12>") 'sr5h-select-slime-repl)
      

(global-unset-key (kbd "C-/"))

(add-hook 'prog-mode-hook (lambda ()
                            (hs-minor-mode t)
                            (company-mode)
                            (font-lock-add-keywords nil
                                                    '(("\\<\\(FIXME\\|TODO\\|BUG\\|MODIFY\\):" 
                                                    1 
                                                    font-lock-warning-face 
                                                    t)))))

(setq ns-function-modifier 'hyper)

(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                                      (abbreviate-file-name (buffer-file-name))
                                      "%b"))))

(global-ede-mode 1)
(semantic-mode 1)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq show-paren-delay 0)
(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)) ; nil for dark text
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
  
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(setq lisp-loop-forms-indentation 2)

;;keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)
;;scroll window up/down by one line
(global-set-key (kbd "C-{") (kbd "C-u 1 M-v"))
(global-set-key (kbd "C-}") (kbd "C-u 1 C-v"))
   
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filname-at-point 'guess)
(setq ido-create-new-buffer 'always)

(setq ido-file-extension-order '(".org" ".txt" ".csv"))

(winner-mode 1)

(windmove-default-keybindings '(control meta))

(setq ispell-program-name "aspell")
(add-hook 'lisp-mode-hook (lambda () (flyspell-mode)
                                     (company-mode)))
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
;; (global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(require 'magit)

(pdf-tools-install)

                      
(add-hook 'pdf-view-mode-hook (lambda ()
                                 (pdf-view-midnight-minor-mode)))
(setq pdf-view-midnight-colors '("gray" . "black"))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy
                           slime-sprof slime-mdot-fu slime-fontifying-fu
                           slime-compiler-notes-tree slime-hyperdoc
                           slime-indentation slime-repl slime-macrostep))
(add-hook 'inferior-lisp-mode-hook
    (lambda () (inferior-slime-mode t)))
(setq slime-auto-select-connection 'always)
(setq slime-kill-without-query-p t)
(setq slime-description-autofocus t)
(setq slime-repl-history-remove-duplicates t)
(setq slime-repl-history-trim-whitespaces t)
(setq  lisp-indent-function 'common-lisp-indent-function)

(global-set-key (kbd "C-c s") 'slime-selector)
(add-hook 'slime-inspector-mode-hook
          (lambda () (define-key slime-inspector-mode-map (kbd ",") #'slime-inspector-pop)))

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
;; TODO: key binding
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))

(which-key-mode t)

;; (add-to-list 'load-path
;;               "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(counsel-projectile-mode)

(require 'auto-yasnippet)
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(company-quickhelp-mode 1)
(setq company-quickhelp-delay 0.7)

(slime-setup '(slime-company))
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-.") 'company-show-location)

(global-set-key (kbd "C-=") 'er/expand-region)

(when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl))

(global-set-key (kbd "C-?") 'hippie-expand)

;; TODO: 
(load "~/.emacs.d/sr5h.el")
