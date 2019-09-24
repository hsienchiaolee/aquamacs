(define-key osx-key-mode-map [(alt h)] nil)
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

  (defhydra hydra-helm (:color teal :hint nil)
"
           Helm

  Navigation        Edit
------------------------------------
 _i_: imenu        _k_: kill ring
 _f_: files
 _F_: file
 _b_: buffer

"
    ("i" helm-semantic-or-imenu)
    ("f" helm-find-files)
    ("F" helm-find)
    ("b" helm-mini)
    ("k" helm-show-kill-ring)
    ("q" nil "cancel" :color blue))
  (global-set-key (kbd "A-h") `hydra-helm/body)
  )

(use-package helm-rg
  :ensure t)

(provide 'setup-helm)
