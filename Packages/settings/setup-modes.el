;; org mode
(use-package org
  :ensure t
  :custom
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  (org-startup-indented t)
  (org-startup-folded "showeverything")
  :hook (
         (org-mode . (lambda () (setq fill-column 120)))
         (org-mode . turn-on-auto-fill)
         (org-mode . visual-line-mode)
         )
  :config
  (define-key org-mode-map (kbd "RET") `org-return-indent)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t)
     (python . t)
     (ruby . t)
     (emacs-lisp . t)))
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
  :defer t
  :config
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
  )

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

;; groovy
(use-package groovy-mode
  :ensure t
  :defer t)

;; yaml
(use-package yaml-mode
  :ensure t
  :defer t)

(provide 'setup-modes)

;; Markdown
(use-package markdown-mode
  :ensure t
  :custom
  (markdown-hide-urls t)
  :mode ("\\.md\\'" . markdown-mode)
  :hook
  (markdown-mode . visual-line-mode))
