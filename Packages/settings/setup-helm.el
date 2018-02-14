(use-package helm
  :ensure t
  :init
  (setq helm-ff-file-name-history-use-recentf t)
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x f" . helm-find)
         ("C-x C-f" . helm-find-files))
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  )

(provide 'setup-helm)
