(use-package clojure-mode
  :mode ("\\.edn\\'" . clojure-mode)
  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . (lambda ()
                           (put-clojure-indent 'run* 'defun)
                           (put-clojure-indent 'run 'defun)
                           (put-clojure-indent 'fresh 'defun)
                           (put-clojure-indent 'conde 'defun)))))

(use-package company)

(use-package cider
  :after (clojure-mode company)
  :hook ((cider-mode . eldoc-mode)
         (cider-mode . company-mode)
         (cider-repl-mode . company-mode)
         (cider-repl-mode . paredit-mode))
  :config
  (setq cider-repl-history-file "~/.emacs.d/cider-history"
        cider-repl-use-pretty-printing t
        cider-repl-use-clojure-font-lock t
        cider-repl-result-prefix ";; => "
        cider-repl-wrap-history t
        cider-repl-history-size 3000
        cider-show-error-buffer nil))

(use-package yasnippet)

(use-package clj-refactor
  :after (clojure-mode yasnippet)
  :hook ((clojure-mode . clj-refactor-mode)
         (clojure-mode . yas-minor-mode))
  :config
  (setq cljr-auto-sort-ns nil)
  (cljr-add-keybindings-with-prefix "C-c RET")
  (add-hook 'nrepl-connected-hook #'cljr-update-artifact-cache)
  (add-hook 'nrepl-connected-hook #'cljr-warm-ast-cache))
