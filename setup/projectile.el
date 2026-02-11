(setq persp-mode-prefix-key (kbd "C-c M-p"))

(defun augustl-projectile-switch-project-workspace ()
  (let* ((project-name (projectile-project-name))
         (workspace-name (if (or (null project-name) (string= project-name "-"))
                             (file-name-nondirectory
                              (directory-file-name (projectile-project-root)))
                           project-name)))
    (persp-switch workspace-name)
    (projectile-find-file)))

(use-package perspective
  :config
  (persp-mode 1))

(use-package projectile
  :config
  (projectile-mode +1)
  (setq projectile-switch-project-action #'augustl-projectile-switch-project-workspace)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
