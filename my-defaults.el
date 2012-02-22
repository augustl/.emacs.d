; Refresh buffers when files change
(global-auto-revert-mode 1)

; Highlight matching parens (and brackets)
(show-paren-mode 1)

; Visual instead of audible warning
(setq visible-bell t)

; Skip startup screen
(setq  inhibit-startup-screen t)

; Integrate kiillring with X clipboard
(setq x-select-enable-clipboard t)

; Indent with spaces
(setq indent-tabs-mode nil)

; Highlight unwanted whitespace
(setq show-trailing-whitespace t)
(setq indicate-empty-lines t)

; Disable ~foo backup files
(setq backup-inhibited t)
(setq auto-save-default nil)

; For emacs cocoa/gtk
(when window-system
  (tool-bar-mode -1)
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (custom-set-variables '(scroll-bar-mode (quote right))))


; Highlight current line
(global-hl-line-mode 1)

; Show line and column numbers
(line-number-mode 1)
(column-number-mode 1)

; Use folders instead of incremenal numbers to name buffers with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; Typing with active region replaces content in region
(delete-selection-mode 1)

; UTF-8 all the things!
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)