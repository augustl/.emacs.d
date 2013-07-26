(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode 1)
            (put-clojure-indent 'run* 'defun)
            (put-clojure-indent 'run 'defun)
            (put-clojure-indent 'fresh 'defun)
            (put-clojure-indent 'conde 'defun)))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))
