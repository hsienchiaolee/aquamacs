(define-key osx-key-mode-map [(alt m)] nil)
(use-package magit
  :ensure t
  :demand
  :init
  (setq magit-auto-revert-mode nil)
  :config
  (defhydra hydra-magit (:color blue
                         :columns 4)
    "magit"
    ("RET" magit-visit-thing "visit magit things at point")
    ("s" magit-status "status")
    ("d" magit-diff "diff")
    ("c" magit-commit "commit")
    ("C" magit-commit-amend "commit-amend")
    ("r" magit-rebase-interactive "rebase-interactive")
    ("m" magit-merge "merge")
    ("l" magit-log-current "log")
    ("q" nil "exit")
    )
  (global-set-key (kbd "A-m") 'hydra-magit/body)
  )

(provide 'setup-magit)
