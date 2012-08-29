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


(add-to-list 'load-path (concat dotfiles-dir "/modes/rhtml"))
(require 'rhtml-mode)
(custom-set-faces '(erb-face ((t (:background nil)))))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'load-path (concat dotfiles-dir "/extensions/recall-position"))
(require 'recall-position)
(global-set-key (kbd "C-c C-s") 'toggle-buffer-pos)

(add-to-list 'load-path (concat dotfiles-dir "/modes/buster-mode"))
(require 'buster-mode)

(add-to-list 'auto-mode-alist '("\\.jspx$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.dtm$" . clojure-mode))

;; Start EDITOR server.
(server-force-delete)
(server-start)
