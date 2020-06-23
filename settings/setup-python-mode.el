(use-package elpy
  :ensure t
  :defer t
  :custom
  (elpy-rpc-python-command "python3")
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (defun python-mode-setup()
    (setq tab-width 4)
    (add-hook 'before-save-hook 'elpy-black-fix-code nil t))
  (add-hook 'elpy-mode-hook 'python-mode-setup)
  )

(provide 'setup-python-mode)
