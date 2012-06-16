(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-auto-merge-delay-time 999999
      ido-enable-prefix nil
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2)
