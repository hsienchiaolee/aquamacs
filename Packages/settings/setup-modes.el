;; org mode
(use-package org
  :ensure t)

;; Go
(use-package env-var-import
  :ensure t
  :config
  (env-var-import '("GOPATH"))
  )

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :interpreter "go"
  :config
  (defun go-mode-setup ()
    (setq compile-command "go build -v && go test -v && go vet")
    (define-key (current-local-map) "\C-c\C-c" 'compile)
    (go-eldoc-setup)
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (local-set-key [(alt b)] 'godef-jump))
  (add-hook 'go-mode-hook 'go-mode-setup)
  )

(use-package go-eldoc
  :ensure t
  :defer t)

(use-package go-autocomplete
  :ensure t
  :defer t
  :config
  (ac-config-default)
  )

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

(provide 'setup-modes)
