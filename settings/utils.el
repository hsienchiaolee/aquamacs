;; eval-and-replace
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; compiling
(global-set-key [(meta ?`)] 'compile)
(global-set-key [(meta ?~)] 'next-error)
(global-set-key [(control meta ?~)] 'first-error)

;; replace string
(global-set-key [(meta alt f)] 'replace-string)

;; duplicate line
(defun duplicate-line ()
  (interactive)
  (let ((text (buffer-substring (line-beginning-position) (line-end-position))))
    (move-end-of-line 1)
    (newline)
    (insert text)))
(global-set-key [(alt p)] 'duplicate-line)

(use-package expand-region
  :ensure t
  :bind ("C-@" . er/expand-region))

(provide 'utils)
