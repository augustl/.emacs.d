(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(defun augustl-load-file (name)
  (load-file (concat dotfiles-dir "/" name)))

(let ((local-file (concat dotfiles-dir "/local.el")))
  (when (file-exists-p local-file)
    (load-file local-file)))

(augustl-load-file "setup/defaults.el")
(augustl-load-file "setup/elpa.el")
(augustl-load-file "setup/ido.el")
(augustl-load-file "setup/diff.el")
(augustl-load-file "setup/lisps.el")
(augustl-load-file "setup/clojure.el")
(augustl-load-file "setup/magit.el")
(augustl-load-file "setup/assorted-keybindings.el")
(augustl-load-file "setup/projectile.el")

(when (or (and (boundp 'augustl-force-theme) augustl-force-theme) window-system)
  (message "Loading theme")
  (augustl-load-file "themes/normal.el"))


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Start EDITOR server.
(load "server")
(unless (server-running-p) (server-start))

;; Get path from shell configs.
(exec-path-from-shell-initialize)
