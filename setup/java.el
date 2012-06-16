;; Treat annotations as comments, for proper indentation
(add-hook 'java-mode-hook '(lambda ()
                             (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
                             (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

;; Tabs for indentation
(add-hook 'java-mode-hook (lambda ()
                            (setq
                             c-basic-offset 8
                             tab-width 8
                             indent-tabs-mode t)))
