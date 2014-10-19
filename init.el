;;; init.el -- this is run first
;;; Nithin Saji
;;; Commentary:
;;; Organize everything once you get some  time.
;;;
;;; Code

;;; Package Management
(setq server-use-tcp t)
(require 'server)
(unless (server-running-p) (server-start))
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
;;;(el-get 'sync)


;;;Custome shit

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq vc-make-backup-files t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Appearance
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default tab-width 4)


(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(transient-mark-mode t)
(setq windmove-wrap-around t)
(global-hl-line-mode)



;;; load things

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/kde-emacs/")
(require 'better-defaults)
(require 'defuns)
(require 'keys)
;;;(require 'elget-sources)
;;;;
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
 (global-set-key  (kbd "C-`") 'er/expand-region)


;;; misc
(require 'guru-mode)
(require 'projectile)
(projectile-global-mode t)
(guru-mode t)

(global-flycheck-mode t)
(auto-revert-mode t)


;;; lisp stuff
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))


;;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/themes")

(require 'starter-kit)
(require 'starter-kit-bindings)
;(require 'starter-kit-lisp)
(add-hook 'html-mode-hook 'web-mode)


(require 'ido-vertical-mode)
(ido-vertical-mode t)

;;; guide-key.el
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-r" "C-t" "C-v"))
(setq guide-key/text-scale-amount '-1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode t)

;;
(require 'wrap-region)
(wrap-region-mode t)

(require 'setup-dired)
(require 'setup-markdown-mode)
(require 'setup-ido)


(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)
(require 'smart-mode-line)


(add-hook 'c-mode-hook (lambda ()
                         (require 'c-eldoc)
                         (c-turn-on-eldoc-mode)))

;(require 'moe-theme-switcher)
;;(load-theme 'afternoon)
(load-theme 'misterioso)
;;;(load-theme 'moe-light)
(require 'init-jedi)



(put 'narrow-to-region 'disabled nil)
(require 'indent-guide)
