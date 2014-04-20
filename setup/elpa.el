(package-initialize)

(add-to-list
 'package-archives
 '("elpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list
 'package-archives
 '("marmalade" . "http://marmalade-repo.org/packages/"))

(defun augustl-require-package (package &optional no-refresh)
  "If a package is not installed, install it. If package is not found, refresh first."
  (if (package-installed-p package)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (augustl-require-package package t)))))

(augustl-require-package 'lua-mode)
(augustl-require-package 'yaml-mode)
(augustl-require-package 'haskell-mode)
(augustl-require-package 'markdown-mode)
(augustl-require-package 'clojure-mode)
(augustl-require-package 'clojure-test-mode)
(augustl-require-package 'clojurescript-mode)
(augustl-require-package 'php-mode)
(augustl-require-package 'scala-mode)
(augustl-require-package 'apache-mode)
(augustl-require-package 'coffee-mode)
(augustl-require-package 'paredit)
(augustl-require-package 'magit)
(augustl-require-package 'exec-path-from-shell)
(augustl-require-package 'groovy-mode)
(augustl-require-package 'nrepl)
(augustl-require-package 'persp-mode)

