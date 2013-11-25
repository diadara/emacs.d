;;; init-jedi.el

;;;Code:

(setq
 ;; python-shell-interpreter "/home/diadara/.virtualenvs/python2/python"
 ;; python-shell-interpreter-args ""
 ;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 ;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 ;; python-shell-extra-pythonpaths
 ;; "/home/diadara/projects/linkaggrigator/"
 python-shell-virtualenv-path
 "/home/diadara/.virtualenvs/python2/")
(defun setup-python()
  (interactive)


  (auto-complete-mode 1)
  (setq jedi:complete-on-dot t)
  (setq jedi:setup-keys t)
  (require 'jedi)
  (setq jedi:server-command
        (list "/usr/bin/python2" jedi:server-script))
  (setq jedi:server-args
        '(
                                        ;"--virtual-env" "/home/diadara/.virtualenvs/django"
                                        ;"--virtual-env" "/home/diadara/.virtualenvs/notesapp"
          "--virtual-env" "/home/diadara/.virtualenvs/python2"

          ))

  (jedi:setup))

(add-hook 'python-mode-hook 'setup-python)
(provide 'init-jedi)
;;; init-jedi.el ends here
