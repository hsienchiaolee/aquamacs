;; Emacs Settings
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq dired-listing-switches "-alh")
(defalias 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode 1)

;; Fix OS X PATH issue
(use-package exec-path-from-shell
  :if (eq system-type 'darwin)
  :custom
  (exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-variables
   '("PATH" "MANPATH" "GOPATH"))
  :config
  (exec-path-from-shell-initialize))

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
  (setq ansible-vault-pass-file "~/.ansible-vault"))

;; dirtrack
(add-hook 'shell-mode-hook
  (lambda ()
    (shell-dirtrack-mode 0)
    ;(setq ssh-directory-tracking-mode 'ftp)
    (setq dirtrack-list '("[A-Za-z] \\([~/\\].*\\)[$]" 1))
    ;(dirtrack-debug-mode)
    (dirtrack-mode)))

(provide 'misc)
