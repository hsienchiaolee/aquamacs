(add-to-list 'display-buffer-alist
             '("^\\*shell\\*$" . (display-buffer-same-window)))

(defun shell-named (name)
  (shell)
  (rename-buffer name)
  (process-kill-without-query (get-buffer-process name)))

(defmacro hot-shell (name)
  `(lambda () (interactive)
     (if (get-buffer ,name) (switch-to-buffer ,name)
       (shell-named ,name))))

(defmacro hot-buffer (name)
  `(lambda () (interactive) (switch-to-buffer ,name)))

(global-set-key [(meta ?1)] (hot-shell "*shell1*"))
(global-set-key [(meta ?2)] (hot-shell "*shell2*"))
(global-set-key [(meta ?3)] (hot-shell "*shell3*"))
(global-set-key [(meta ?4)] (hot-shell "*shell4*"))
(global-set-key [(meta ?5)] (hot-shell "*shell5*"))
(global-set-key [(meta ?6)] (hot-shell "*shell6*"))
(global-set-key [(meta ?7)] (hot-shell "*shell7*"))
(global-set-key [(meta ?8)] (hot-shell "*shell8*"))
(global-set-key [(meta ?9)] (hot-shell "*shell9*"))
(global-set-key [(meta ?0)] (hot-shell "*shell0*"))

(provide 'shortcut-shell)
