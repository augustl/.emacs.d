(augustl-require-package 'flx-ido)
;(augustl-require-package 'ido-ubiquitous)
(augustl-require-package 'ido-vertical-mode)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-auto-merge-delay-time 999999
      ido-enable-prefix nil
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-virtual-buffers t
      ido-case-fold t
      ido-handle-duplicate-virtual-buffers 2)


(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

;(require 'ido-ubiquitous)
; (ido-ubiquitous-mode 1)

(require 'ido-vertical-mode)
(ido-vertical-mode)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
