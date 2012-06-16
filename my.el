(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(load-file (concat dotfiles-dir "/my-defaults.el"))
(load-file (concat dotfiles-dir "/elpa-init.el"))

; ido, yay
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-auto-merge-delay-time 999999
      ido-enable-prefix nil
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2)

; Enable vendored modes
(add-to-list 'load-path (concat dotfiles-dir "/modes"))

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
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))


(require 'whitespace)
(setq
 whitespace-style '(face trailing lines-tail tabs)
 whitespace-line-column 80)

(when window-system
  (add-to-list 'default-frame-alist '(background-color . "#000000"))
  (add-to-list 'default-frame-alist '(foreground-color . "#dddddd"))
  (set-face-background 'hl-line "#222222"))


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
