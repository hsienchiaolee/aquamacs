;; time stamp
(defun insert-day-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y-%m-%d" (current-time))))
(global-set-key [(alt ?-)] 'insert-day-stamp)

(defun insert-compact-day-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y%m%d" (current-time))))
(global-set-key [(meta ?-)] 'insert-compact-day-stamp)

(defun insert-time-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y%m%d-%H%M%S" (current-time))))
(global-set-key [(alt ?_)] 'insert-time-stamp)
;; (put 'downcase-region 'disabled nil)

(provide 'shortcut-timestamp)
