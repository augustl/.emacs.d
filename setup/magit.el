;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "black")))

(global-set-key (kbd "C-x m") 'magit-status)
