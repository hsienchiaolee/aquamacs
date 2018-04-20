;; org mode
(use-package org
  :ensure t)

;; swift
(use-package swift-mode
  :ensure t
  :mode "\\.swift\\'"
  :interpreter "swift")

(use-package flycheck-swift
  :ensure t
  :defer t
  :config
  (flycheck-swift-setup)
  )

;; terraform
(use-package terraform-mode
  :ensure t
  :defer t)

;; puppet
(use-package puppet-mode
  :ensure t
  :defer t)

;; yaml
(use-package yaml-mode
  :ensure t
  :defer t)

(provide 'setup-modes)
