(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

; Deep parent indents (i.e. multiline arrays/hashes)
(custom-set-variables '(ruby-deep-indent-paren nil))
