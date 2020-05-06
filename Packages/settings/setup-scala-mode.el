(use-package scala-mode2
  :ensure t
  :defer t
  )

(use-package flycheck-cask
  :commands flycheck-cask-setup
  :config
  (add-hook 'emacs-lisp-mode-hook (flycheck-cask-setup)))

(provide 'setup-scala-mode)
