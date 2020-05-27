(use-package scala-mode
  :ensure t
  :mode "\\.scala\\'"
  :interpreter "scala"
  :config
  (add-hook 'scala-mode-hook 'line-number-mode)
  )

(use-package flycheck-cask
  :commands flycheck-cask-setup
  :config
  (add-hook 'emacs-lisp-mode-hook (flycheck-cask-setup)))

(provide 'setup-scala-mode)
