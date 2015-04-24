(augustl-require-package 'magit)

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "black")))
