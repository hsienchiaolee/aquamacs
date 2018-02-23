(use-package ensime
  :ensure t
  :pin melpa-stable
  :defer t
  :init
  (add-to-list 'exec-path "/opt/local/bin")
  :config
  (setq ensime-startup-snapshot-notification nil)
  (setq ensime-startup-notification nil)
  :bind (:map ensime-mode-map
         ("C-c C-b h" . sbt-hydra)))

(use-package flycheck-cask
  :commands flycheck-cask-setup
  :config
  (add-hook 'emacs-lisp-mode-hook (flycheck-cask-setup)))

(provide 'setup-scala-mode)
