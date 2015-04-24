(augustl-require-package 'paredit)
(augustl-require-package 'clojure-mode)
(augustl-require-package 'clojure-test-mode)
(augustl-require-package 'clojurescript-mode)
(augustl-require-package 'nrepl)

(add-hook 'clojure-mode-hook
          (lambda ()
            (put-clojure-indent 'run* 'defun)
            (put-clojure-indent 'run 'defun)
            (put-clojure-indent 'fresh 'defun)
            (put-clojure-indent 'conde 'defun)))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

(add-hook 'lisp-mode-hook #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
