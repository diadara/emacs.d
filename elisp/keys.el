;;; Custom key Bindings
(global-set-key (kbd "RET") 'newline-and-indent)
;;; enter a new line below
(global-set-key (kbd "M-C-j")
                (lambda()
                  (interactive)
                  (end-of-line)
                  (newline-and-indent)
                  ))
(global-set-key (kbd "S-C-j")
                (lambda()
                  (interactive)
                  (previous-line)
                  (end-of-line)
                  (newline-and-indent)
                  ))

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-f") 'esk-sudo-edit)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "<f5>") 'cut-line-or-region) ; cut.
(global-set-key (kbd "<f6>") 'copy-line-or-region) ; copy.
(global-set-key (kbd "<f7>") 'yank) ; paste.

(global-set-key (kbd "C-,") 'ace-jump-mode)
(global-set-key (kbd "M-C-,") 'ace-jump-word-mode)

(provide 'keys)



(defun diadara-org-mode-keys ()

  ;; …
  )

;; add to html-mode-hook
(add-hook 'org-mode-hook (lambda ()
                           "Modify keymaps used by `org-mode'."
                           (local-set-key (kbd "C-c p") 'org-pomodoro)
                           ))

(global-set-key [f11] 'fullscreen)
(global-set-key (kbd "C-c M-f") 'find-file-at-point)

(add-hook 'latex-mode-hook (lambda ()
                             (local-set-key (kbd "C-c C-r") 'redraw-display)
                             ))
