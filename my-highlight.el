(defface my-highlight-bg-face
  '((((class color)) (:foreground "gray15")))
  "Face for my-highlight background")

(defun my-highlight-clear-overlays ()
  (remove-overlays nil nil 'my-highlight-overlay t))

(defun my-highlight-destroy ()
  (interactive)
  (my-highlight-clear-overlays))

(defun my-highlight-get-current-overlay-ranges ()
  (let* ((xs-pairs (overlay-lists))
         (xs (append (cdr xs-pairs) (car xs-pairs)))
         (res '()))
    (while xs
      (-when-let (x (car xs))
        (when (overlay-get x 'my-highlight-overlay)
          (!cons (list (overlay-start x) (overlay-end x)) res)))
      (!cdr xs))
    res))

(defun my-highlight-get-current-overlay-gaps ()
  (-partition 2 (-butlast (cdr (apply 'append (my-highlight-get-current-overlay-ranges))))))

(defun my-highlight-range (range-start range-end range-min range-max)
  (let ((current-gaps (my-highlight-get-current-overlay-gaps)))
    (my-highlight-clear-overlays)
    (let ((ol (make-overlay range-min range-max)))
      (overlay-put ol 'my-highlight-overlay t)
      (overlay-put ol 'face 'my-highlight-bg-face))
    (remove-overlays range-start range-end 'my-highlight-overlay t)
    (while current-gaps
      (let ((gap (car current-gaps)))
        (remove-overlays (car gap) (car (cdr gap)) 'my-highlight-overlay t))
      (!cdr current-gaps))
    (message (prin1-to-string current-gaps))))

(defun my-highlight-current-line ()
  (interactive)
  (my-highlight-range (line-beginning-position) (line-end-position) (point-min) (point-max)))

(defun my-highlight-region ()
  (interactive)
  (my-highlight-range (region-beginning) (region-end) (point-min) (point-max))
  (goto-char (region-beginning))
  (deactivate-mark))

(defun my-highlight ()
  (interactive)
  (if (use-region-p)
      (my-highlight-region)
    (my-highlight-current-line)))

(global-set-key (kbd "C-x p h") 'my-highlight)
(global-set-key (kbd "C-x p d") 'my-highlight-destroy)
