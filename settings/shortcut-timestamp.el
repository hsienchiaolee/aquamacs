;; time stamp
(defun insert-day-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y-%m-%d" (current-time))))
(global-set-key (kbd "s--") 'insert-day-stamp)

(defun insert-compact-day-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y%m%d" (current-time))))
(global-set-key (kbd "M--") 'insert-compact-day-stamp)

(defun insert-time-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y%m%d-%H%M%S" (current-time))))
(global-set-key (kbd "s-_") 'insert-time-stamp)
;; (put 'downcase-region 'disabled nil)

(provide 'shortcut-timestamp)
