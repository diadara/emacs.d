;;; Erc stuff
(defun erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer."
  (interactive)
  (if (get-buffer "irc.freenode.net:6665") ;; ERC already active?

   (erc-track-switcph-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6665 :nick "diadara" :full-name "Nithin Saji" :password "1appu1")
      )))
(setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#erc" "#python" "#pocoo" "#gsoc" )))

(provide 'setup-erc)
