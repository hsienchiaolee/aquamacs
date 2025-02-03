;; Emacs Settings
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq dired-listing-switches "-alh")
(defalias 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode 1)

;; auto complete
(setq-default completion-ignore-case t)
(setq-default pcomplete-ignore-case t)

;; disable shell echo
(setq comint-process-echoes t)
(put 'erase-buffer 'disabled nil)

;; vagrant-tramp
(use-package vagrant-tramp
  :ensure t)

;; tramp
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; ansible valut
(use-package ansible-vault
  :ensure t
  :pin melpa-stable
  :defer t
  :init
  (setq ansible-vault-pass-file "~/.ansible-vault")
  :config
  ;; Automatically send ansible value passwords invisibily
  (setq comint-password-prompt-regexp
      (concat comint-password-prompt-regexp
              "\\|^Vault password:\\s *\\'")))

;; dirtrack
(add-hook 'shell-mode-hook
  (lambda ()
    (shell-dirtrack-mode 0)
    ;(setq ssh-directory-tracking-mode 'ftp)
    (setq dirtrack-list '("[A-Za-z] \\([~/\\].*\\)[$]" 1))
    ;(dirtrack-debug-mode)
    (dirtrack-mode)))

(provide 'misc)
