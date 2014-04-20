(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(defun augustl-load-file (name)
  (load-file (concat dotfiles-dir "/" name)))

(augustl-load-file "setup/defaults.el")
(augustl-load-file "setup/elpa.el")
(augustl-load-file "setup/ido.el")
(augustl-load-file "setup/diff.el")
(augustl-load-file "setup/java.el")
(augustl-load-file "setup/ruby.el")
(augustl-load-file "setup/lisps.el")
(augustl-load-file "setup/magit.el")
(augustl-load-file "setup/assorted-keybindings.el")
(augustl-load-file "setup/groovy.el")

(when (or (and (boundp 'augustl-force-theme) augustl-force-theme) window-system)
  (message "Loading theme")
  (augustl-load-file "themes/normal.el"))


(add-to-list 'load-path (concat dotfiles-dir "/modes/rhtml"))
(require 'rhtml-mode)
(custom-set-faces '(erb-face ((t (:background nil)))))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'load-path (concat dotfiles-dir "/extensions/recall-position"))
(require 'recall-position)
(global-set-key (kbd "C-c C-s") 'toggle-buffer-pos)

(persp-mode t)

(add-to-list 'load-path (concat dotfiles-dir "/modes/buster-mode"))
(require 'buster-mode)

(add-to-list 'auto-mode-alist '("\\.jspx$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.dtm$" . clojure-mode))

;; Start EDITOR server.
(load "server")
(unless (server-running-p) (server-start))

;; Get path from shell configs.
(exec-path-from-shell-initialize)
