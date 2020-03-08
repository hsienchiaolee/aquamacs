(use-package helm
  :ensure t
  :init
  (setq helm-ff-file-name-history-use-recentf t)
  :bind (("C-x b" . helm-mini))
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  )

(use-package helm-rg
  :ensure t)

(provide 'setup-helm)
