(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load-file (concat (file-name-directory (or (buffer-file-name) load-file-name)) "/my.el"))

(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))
