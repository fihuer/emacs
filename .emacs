;; affichage des numeros de lignes et de colones
(setq line-number-mode t)
(setq column-number-mode t)

;; affichage des trailing whitespaces
(setq-default show-trailing-whitespace t)

;; pas de backup des fichiers
(setq make-backup-files nil)

(setq c-default-style "k&r")
(setq c-basic-offset 8)
(setq puppet-indent-level 4)
(setq load-path (cons "~/.emacs.d" load-path))
(setq load-path (cons "~/.emacs.d/auto-complete" load-path))
(setq load-path (cons "~/.emacs.d/popup-el" load-path))
(require 'auto-complete)
(require 'color-theme)

(defun color-theme-undo ()
 (interactive)
 (color-theme-reset-faces)
 (color-theme-snapshot))

;; backup current color theme
(fset 'color-theme-snapshot (color-theme-make-snapshot))


;;change color theme
(color-theme-initialize)
(color-theme-euphoria)

(global-set-key (kbd "C-c C-c") (kbd "C-a C-SPC C-n M-;"))

(global-font-lock-mode 1)


(add-to-list 'load-path "~/.emacs.d/enhanced-ruby-mode") ; must be added after any path containing old ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq enh-ruby-program "~/.rvm/wrappers/ruby-2.0.0-p643/ruby")
(eval-after-load 'enh-ruby-mode
 '(remove-hook 'enh-ruby-mode-hook 'erm-define-faces))

;; (defalias 'defvar-local 'defvar)
(add-to-list 'load-path "~/.emacs.d/dash.el")
;; (add-to-list 'load-path "~/.emacs.d/dash.el-1.5.0")
(add-to-list 'load-path "~/.emacs.d/smartparens")
(require 'smartparens-config)
 (require 'smartparens-ruby)
 (smartparens-global-mode)
 (show-smartparens-global-mode t)

(add-to-list 'load-path "~/.emacs.d/flx-0.5")
(require 'flx)
(require 'flx-ido)
(add-to-list 'load-path "~/.emacs.d/grizzl")
(add-to-list 'load-path "~/.emacs.d/projectile")
(add-to-list 'load-path "~/.emacs.d/s.el")
(require 'grizzl)
(setq max-lisp-eval-depth 10000)
(require 'projectile)
 (projectile-global-mode)
 (setq projectile-enable-caching t)
 (setq projectile-completion-system 'grizzl)
 ;; Press Command-p for fuzzy find in project
 (global-set-key (kbd "M-p") 'projectile-find-file)
 ;; Press Command-b for fuzzy switch buffer
 (global-set-key (kbd "M-b") 'projectile-switch-to-buffer)

;; (add-to-list 'load-path "~/.emacs.d/robe")
;; (add-to-list 'load-path "~/.emacs.d/inf-ruby")
;; (require 'robe)
;; (add-hook 'enh-ruby-mode-hook 'robe-mode)
;; (add-hook 'robe-mode-hook 'ac-robe-setup)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(global-set-key (kbd "C-c C-t") 'multi-term)

(add-to-list 'load-path "~/.emacs.d/textmate.el")
(require 'textmate)
(textmate-mode)
