(augustl-require-package 'clojure-mode)
;; (augustl-require-package 'clojurescript-mode)
;; (augustl-require-package 'nrepl)

(add-hook 'clojure-mode-hook
          (lambda ()
            (put-clojure-indent 'run* 'defun)
            (put-clojure-indent 'run 'defun)
            (put-clojure-indent 'fresh 'defun)
            (put-clojure-indent 'conde 'defun)))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook (lambda () (paredit-mode 1)))

(augustl-require-package 'cider)
(augustl-require-package 'company)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-use-pretty-printing t)
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-result-prefix ";; => ")
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 3000)
(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-show-error-buffer nil)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(augustl-require-package 'clj-refactor)

(require 'clj-refactor)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            ;; insert keybinding setup here
            (cljr-add-keybindings-with-prefix "C-c RET")))
(add-hook 'clojure-mode-hook (lambda () (yas/minor-mode 1)))
(setq cljr-auto-sort-ns nil)
(add-hook 'nrepl-connected-hook #'cljr-update-artifact-cache)
(add-hook 'nrepl-connected-hook #'cljr-warm-ast-cache)
