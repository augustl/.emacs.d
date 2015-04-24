(augustl-require-package 'flycheck)
(augustl-require-package 'flycheck-clojure)

(require 'flycheck)
(eval-after-load 'flycheck '(add-to-list 'flycheck-checkers 'clojure-cider-eastwood))

(add-hook 'cider-mode-hook (lambda ()
                             (when (s-ends-with-p ".clj" (buffer-file-name))
                               (flycheck-mode 1))))
