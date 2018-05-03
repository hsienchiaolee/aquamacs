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
;; gem install puppet-lint
(use-package flymake-puppet
  :ensure t
  :defer t)

(use-package puppet-mode
  :ensure t
  :mode "\\.pp\\'"
  :config
  (require 'flymake-puppet)
  (add-hook 'puppet-mode-hook 'flymake-puppet-load)
  )

;; yaml
(use-package yaml-mode
  :ensure t
  :defer t)

(provide 'setup-modes)
