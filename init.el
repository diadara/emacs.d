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

;;;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;;; I don't like el-get anymore
;;;(unless (require 'el-get nil 'noerror)
  ;;;(with-current-buffer
      ;;;(url-retrieve-synchronously
       ;;;"https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    ;;;(let (el-get-master-branch)
      ;;;(goto-char (point-max))
      ;;;(eval-print-last-sexp))))

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
(require 'auto-complete)
(global-auto-complete-mode 1)
(require 'guru-mode)
(guru-mode t)
(require 'auto-complete)
(global-flycheck-mode t)
(auto-revert-mode t)

;;; paredit for slime 
(add-hook 'slime-mode-hook 'paredit-mode)
(add-hook 'inferior-lisp-mode-hook 'paredit-mode)

;;; python stuff
(require 'init-jedi)

;;; lisp stuff
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(setq inferior-lisp-program "/usr/bin/sbcl")
;;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/themes")

(require 'starter-kit)
(require 'starter-kit-bindings)
(require 'starter-kit-js)
(require 'starter-kit-lisp)
(add-hook 'html-mode-hook 'web-mode)
(require 'pretty-symbols)

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
(require 'setup-erc)
(eval-after-load 'org-mode
      '(define-key org-mode-map (kbd "C-c p") 'org-pomodoro))

(require 'indent-guide)
;(indent-guide-global-mode)
(add-hook 'latex-mode-hook (lambda ()
                             (setq TeX-auto-save t)
                             (setq TeX-parse-self t)
                             (setq TeX-save-query nil)
                             (setq TeX-PDF-mode t)
                             ))
(require 'projectile)
(projectile-global-mode t)
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 120
                    :weight 'normal
                    :width 'normal)

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "DejaVu Sans Mono"
                               :width 'normal
                               :size 13.4
                               :weight 'normal)))
(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)
(require 'smart-mode-line)
(sml/setup)
  (require 'sublimity)
  (require 'sublimity-scroll)
;  (require 'sublimity-map)              


;; (setq redisplay-dont-pause t
;;       scroll-margin 1
;;       scroll-step 1
;;       scroll-conservatively 10000
;;       scroll-preserve-screen-position 1)
;; (setq mouse-wheel-follow-mouse 't)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(add-hook 'c-mode-hook (lambda ()
                         (require 'c-eldoc)
                         (c-turn-on-eldoc-mode)))
(defun my/edit-init () (interactive)
  (find-file "/home/diadara/.emacs.d/init.el"))
(global-set-key (kbd "C-c i") 'my/edit-init)
;(require 'moe-theme-switcher)
(load-theme 'afternoon)
;;;(load-theme 'moe-light)



(setq org-agenda-files '("~/org"))
(setq org-directory "~/")
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-log-done 'time)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key (kbd "C-c c") 'org-capture)

(put 'narrow-to-region 'disabled nil)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/gtd.org") "Tasks")
         "* TODO %?\n %i\n")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("l" "Link" plain (file (concat org-directory "/links.org"))
         "- %?\n %x\n")))
(setq frame-title-format
      '( multiple-frames "%b"
                         ("" invocation-name "--" server-name)))
(add-hook 'create-frame-hook (lambda (frame) 
                             (while (string= "irc" server-name)
                               (erc-start-or-switch))))
