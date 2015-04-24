(augustl-require-package 'paredit)
(augustl-require-package 'clojure-mode)
(augustl-require-package 'clojure-test-mode)
(augustl-require-package 'clojurescript-mode)
(augustl-require-package 'nrepl)

(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode 1)
            (put-clojure-indent 'run* 'defun)
            (put-clojure-indent 'run 'defun)
            (put-clojure-indent 'fresh 'defun)
            (put-clojure-indent 'conde 'defun)))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))
