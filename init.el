;;; init.el
;;; Nithin Saji
;;; Code

;;; Package Management
(require 'server)
(unless (server-running-p) (server-start))
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Appearance


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
(require 'elget-sources)
;;;;

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

;;;(global-auto-complete-mode 1)
;;;(guru-mode t)
;;; paredit for slime 
(add-hook 'slime-mode-hook 'paredit-mode)
(add-hook 'inferior-lisp-mode-hook 'paredit-mode)

;;; python stuff

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(require 'init-jedi)
(setq inferior-lisp-program "/usr/bin/sbcl")


(defun djcb-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer."
  (interactive)
  (if (get-buffer "irc.freenode.net:6665") ;; ERC already active?

;;;    (erc-track-switcph-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6665 :nick "diadara" :full-name "Nithin Saji" :password "1appu1")
      )))
;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)





(require 'auto-complete)
(global-auto-complete-mode t)
(global-flycheck-mode t)

;;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/themes")



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(modeline ((t (:background "#183c66" :foreground "#FFFFFF" :height 0.7))) t)
 '(sml-modeline-end-face ((t (:height 0.7))) t))



;;;Clojure
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(setq nrepl-history-file "~/.emacs.d/nrepl-history")
(setq nrepl-popup-stacktraces t)
(setq nrepl-popup-stacktraces-in-repl t)
(add-hook 'nrepl-connected-hook
          (defun pnh-clojure-mode-eldoc-hook ()
            (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
            (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
            (nrepl-enable-on-existing-clojure-buffers)))
(add-hook 'nrepl-mode-hook 'subword-mode)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)

(require 'starter-kit)
(require 'starter-kit-bindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "636ecbf1091fbc99d95526d7a3a4810d1ccb58997e58bd3184863821303553f3" "690585947abcb3fc7f52e6683b8375f00eef7ea55d028dcf81c9f5accb4dffe5" default))))
