;;; better-defaults.el --- Fixing weird quirks and poor defaults

;; Copyright © 2013 Phil Hagelberg

;; Author: Phil Hagelberg
;; URL: https://github.com/technomancy/better-defaults
;; Version: 0.1.2
;; Created: 2013-04-16
;; Keywords: convenience

;; This file is NOT part of GNU Emacs.

;;;Code
;;;###autoload
(progn
  
  (ido-mode t)
  (setq ido-enable-flex-matching t)

  (menu-bar-mode -1)
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (require 'saveplace)
  (setq-default save-place t)

  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)
 
(defun elscreen-frame-title-update ()
   (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
     (let* ((screen-list (sort (elscreen-get-screen-list) '<))
 	   (screen-to-name-alist (elscreen-get-screen-to-name-alist))
 	   (title (mapconcat
 		   (lambda (screen)
 		     (format "%d%s %s"
 			     screen (elscreen-status-label screen)
 			     (get-alist screen screen-to-name-alist)))
 		   screen-list " ")))
       (if (fboundp 'set-frame-name)
 	  (set-frame-name title)
 	(setq frame-title-format title)))))
 
 (eval-after-load "elscreen"
   '(add-hook 'elscreen-screen-update-hook 'elscreen-frame-title-update))
  (show-paren-mode 1)
  (global-linum-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))

(provide 'better-defaults)
;;; better-defaults.el ends here
