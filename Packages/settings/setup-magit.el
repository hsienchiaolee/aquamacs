(define-key osx-key-mode-map [(alt m)] nil)
(use-package magit
  :ensure t
  :init
  (setq magit-auto-revert-mode nil)
  :bind (("A-m s" . magit-status)
         ("A-m d" . magit-diff)
         ("A-m c" . magit-commit)
         ("A-m C" . magit-commit-amend)
         ("A-m r" . magit-rebase-interactive)
         ("A-m m" . magit-merge)
         ("A-m l" . magit-log-current))
  )

(provide 'setup-magit)
