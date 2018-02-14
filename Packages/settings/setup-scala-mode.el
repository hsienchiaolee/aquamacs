(use-package ensime
  :ensure t
  :pin melpa-stable
  :defer t
  :init
  (add-to-list 'exec-path "/opt/local/bin")
  (bind-key "C-c C-b" 'sbt-hydra)
  :config
  (setq ensime-startup-snapshot-notification nil)
  (setq ensime-startup-notification nil)
  )

(use-package projectile
  :ensure t
  :defer t)

(use-package flycheck-cask
  :commands flycheck-cask-setup
  :config
  (add-hook 'emacs-lisp-mode-hook (flycheck-cask-setup)))

(provide 'setup-scala-mode)
