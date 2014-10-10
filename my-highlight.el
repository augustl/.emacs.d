(defface my-highlight-bg-face
  '((((class color)) (:foreground "gray15")))
  "Face for my-highlight background")

(defvar my-highlight-overlays nil)
(make-variable-buffer-local 'my-highlight-overlays)
(defvar my-highlight-segments nil)
(make-variable-buffer-local 'my-highlight-segments)

(defun my-highlight-destroy-iter (overlays)
  (when (> (length overlays) 0)
    (delete-overlay (car overlays))
    (my-highlight-destroy-iter (cdr overlays))))

(defun my-highlight-put-overlay (start end)
  (let ((ol (make-overlay start end)))
    (overlay-put ol 'face 'my-highlight-bg-face)
    (setq my-highlight-overlays (cons ol my-highlight-overlays))))

(defun my-highlight-create-overlays-for-segments-iter (overlay-positions)
  (when (> (length overlay-positions) 0)
    (my-highlight-put-overlay (car overlay-positions) (car (cdr overlay-positions)))
    (my-highlight-create-overlays-for-segments-iter (cdr (cdr overlay-positions)))))

(defun my-highlight-get-overlay-positions-for-segments (overlay-start overlay-end segments)
  (append (list overlay-start) (apply 'append segments) (list overlay-end)))

(defun my-highlight-create-overlays-for-segments (overlay-start overlay-end)
  (my-highlight-create-overlays-for-segments-iter
   (my-highlight-get-overlay-positions-for-segments overlay-start overlay-end my-highlight-segments)))

(defun wrap-intersecting-segments-iter (start end segments before inside after)
  (-if-let (segment (car segments))
      (let ((seg-start (car segment))
            (seg-end (car (cdr segment))))
        (cond ((< seg-end start) (wrap-intersecting-segments-iter start end (cdr segments) (cons segment before) inside after))
              ((> seg-start end) (wrap-intersecting-segments-iter start end (cdr segments) before inside (cons segment after)))
              (t (wrap-intersecting-segments-iter start end (cdr segments) before (cons segment inside) after))))
    (let ((res (make-hash-table :test 'equal)))
      (puthash "before" before res)
      (puthash "inside" inside res)
      (puthash "after" after res)
      res)))

(defun my-highlight-merge-segments (start end segments)
  (list
   (list
    (apply 'min (cons start (mapcar (lambda (seg) (car seg)) segments)))
    (apply 'max (cons end (mapcar (lambda (seg) (car (cdr seg))) segments))))))

(defun my-highlight-wrap-intersecting-segments (start end segments)
  (let ((seg-groups (wrap-intersecting-segments-iter start end segments nil nil nil)))
    (append (gethash "before" seg-groups) (my-highlight-merge-segments start end (gethash "inside" seg-groups)) (gethash "after" seg-groups))))

(defun my-highlight-sort-segments (segments)
  (sort segments (lambda (a b) (< (car a) (car b)))))

(defun my-highlight-put-segment (start end)
  (if (<= end start)
      (error (concat "End of segment must be one or more higher than start, got " start " and " end)))
  (setq my-highlight-segments (my-highlight-sort-segments (my-highlight-wrap-intersecting-segments start end my-highlight-segments))))

(defun my-highlight-clear-overlays ()
  (my-highlight-destroy-iter my-highlight-overlays)
  (setq my-highlight-overlays nil))

(defun my-highlight-destroy ()
  (interactive)
  (setq my-highlight-segments nil)
  (my-highlight-clear-overlays))

(defun my-highlight-range (start end)
  (my-highlight-clear-overlays)
  (my-highlight-put-segment start end)
  (my-highlight-create-overlays-for-segments (point-min) (point-max)))

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
