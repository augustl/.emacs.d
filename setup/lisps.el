(augustl-require-package 'paredit)

(add-hook 'lisp-mode-hook #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
