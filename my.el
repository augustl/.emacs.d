; Enable bundled modes
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-delay-time 999999)

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

(add-to-list 'load-path (concat dotfiles-dir "/modes/apache"))
(require 'apache-mode)

(add-to-list 'load-path (concat dotfiles-dir "/modes/vcl"))
(require 'vcl-mode)

(add-to-list 'load-path (concat dotfiles-dir "/modes/js3-mode"))
(autoload 'js3-mode "js3" nil t)

(add-to-list 'load-path (concat dotfiles-dir "/extensions/recall-position"))
(require 'recall-position)
(global-set-key (kbd "C-c C-s") 'toggle-buffer-pos)

(add-to-list 'load-path (concat dotfiles-dir "/modes/buster-mode"))
(require 'buster-mode)

(add-to-list 'load-path (concat dotfiles-dir "/modes/scala-mode"))
(require 'scala-mode)


; Settings
(setq visible-bell t)
(global-auto-revert-mode)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq x-select-enable-clipboard t)
(show-paren-mode 1)

; Disable ~foo backup files
(setq backup-inhibited t)
(setq auto-save-default nil)

; For emacs cocoa/gtk
(tool-bar-mode -1)

(custom-set-variables '(scroll-bar-mode (quote right)))

(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(when window-system 
  (add-to-list 'default-frame-alist '(background-color . "#000000")) 
  (add-to-list 'default-frame-alist '(foreground-color . "#dddddd"))
  (set-face-background 'hl-line "#222222"))


(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jspx$" . html-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

; java-mode: treat annotations as comments, for proper indentation
(add-hook 'java-mode-hook '(lambda ()
                             (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
                             (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

; java-mode: tabs for indentation
(add-hook 'java-mode-hook (lambda ()
                            (setq
                             c-basic-offset 8
                             tab-width 8
                             indent-tabs-mode t)))

(custom-set-faces
 '(diff-added ((t (:foreground "chartreuse4"))))
 '(diff-hunk-header ((t (:foreground "RoyalBlue1"))))
 '(diff-removed ((t (:foreground "red")))))

; Deep parent indents in ruby-mode (i.e. multiline arrays/hashes)
(custom-set-variables '(ruby-deep-indent-paren nil))
