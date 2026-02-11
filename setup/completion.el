(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

(use-package vertico
  :init
  (vertico-mode 1)
  (setq vertico-cycle t))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles basic partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package consult
  :bind (("C-c s l" . consult-line)
         ("C-c s r" . consult-ripgrep)
         ("M-y" . consult-yank-pop)))
