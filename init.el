; Enable bundled modes
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

; Enable vendored modes
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "/modes"))

(add-to-list 'load-path (concat dotfiles-dir "/modes/rhtml"))
(require 'rhtml-mode)
(custom-set-faces '(erb-face ((t (:background nil)))))

(add-to-list 'load-path (concat dotfiles-dir "/modes/yaml"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'load-path (concat dotfiles-dir "/modes/lua"))
(require 'lua-mode)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

; Settings
(setq visible-bell t)
(global-auto-revert-mode)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq x-select-enable-clipboard t)

; Disable ~foo backup files
(setq backup-inhibited t)
(setq auto-save-default nil)

; For emacs cocoa/gtk
(tool-bar-mode -1)
(menu-bar-mode -1)

(custom-set-variables '(scroll-bar-mode (quote right)))

(global-hl-line-mode 1)
(set-face-background 'hl-line "#f0f0f0")
(custom-set-faces '(default ((t (:family "Inconsolata")))))
(line-number-mode 1)
(column-number-mode 1)


(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jspx$" . html-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))