(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(defun augustl-load-file (name)
  (load-file (concat dotfiles-dir "/" name)))

(augustl-load-file "my-defaults.el")
(augustl-load-file "setup/elpa.el")
(augustl-load-file "setup/ido.el")
(augustl-load-file "setup/diff.el")
(augustl-load-file "setup/java.el")
(augustl-load-file "setup/ruby.el")


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

(when window-system
  (add-to-list 'default-frame-alist '(background-color . "#000000"))
  (add-to-list 'default-frame-alist '(foreground-color . "#dddddd"))
  (set-face-background 'hl-line "#222222"))

