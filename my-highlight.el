(defface my-highlight-bg-face
  '((((class color)) (:foreground "gray15")))
  "Face for my-highlight background")

(defun my-highlight-destroy ()
  (interactive)
  (remove-overlays nil nil 'my-highlight-overlay t))

(defun my-highlight-get-my-overlays ()
  (let* ((xs-pairs (overlay-lists))
         (xs (append (cdr xs-pairs) (car xs-pairs))))
    (--filter (overlay-get it 'my-highlight-overlay) xs)))

(defun my-highlight-get-current-overlay-ranges ()
  (nreverse
   (--map
    (list (overlay-start it) (overlay-end it))
    (my-highlight-get-my-overlays))))

(defun my-highlight-get-current-overlay-gaps ()
  (-partition 2 (-butlast (cdr (apply 'append (my-highlight-get-current-overlay-ranges))))))

(defun my-highlight-range (range-start range-end)
  (let ((current-gaps (my-highlight-get-current-overlay-gaps)))
    (my-highlight-destroy)
    (let ((ol (make-overlay (point-min) (point-max))))
      (overlay-put ol 'my-highlight-overlay t)
      (overlay-put ol 'face 'my-highlight-bg-face))
    (remove-overlays range-start range-end 'my-highlight-overlay t)
    (--each current-gaps
      (remove-overlays (car it) (cadr it) 'my-highlight-overlay t))
    (message (prin1-to-string current-gaps))))

(defun my-highlight-current-line ()
  (interactive)
  (my-highlight-range (line-beginning-position) (line-end-position)))

(defun my-highlight-region ()
  (interactive)
  (my-highlight-range (region-beginning) (region-end))
  (goto-char (region-beginning))
  (deactivate-mark))

(defun my-highlight ()
  (interactive)
  (if (use-region-p)
      (my-highlight-region)
    (my-highlight-current-line)))

(global-set-key (kbd "C-x p h") 'my-highlight)
(global-set-key (kbd "C-x p d") 'my-highlight-destroy)
