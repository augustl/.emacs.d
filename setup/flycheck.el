(augustl-require-package 'flycheck)
(augustl-require-package 'flycheck-clojure)

(require 'flycheck)
(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)
