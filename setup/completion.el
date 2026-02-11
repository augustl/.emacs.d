(augustl-require-package 'vertico)
(augustl-require-package 'orderless)
(augustl-require-package 'marginalia)
(augustl-require-package 'consult)

(vertico-mode 1)
(savehist-mode 1)

(setq vertico-cycle t)

(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides
      '((file (styles basic partial-completion))))

(marginalia-mode 1)

(global-set-key (kbd "C-c s l") #'consult-line)
(global-set-key (kbd "C-c s r") #'consult-ripgrep)
(global-set-key (kbd "M-y") #'consult-yank-pop)
