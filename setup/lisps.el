(add-hook 'clojure-mode-hook (lambda () (paredit-mode 1)))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

