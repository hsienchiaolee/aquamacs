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
(define-key osx-key-mode-map [(alt \\) ?T] 'tramp-cleanup-all-connections)

;; ansible valut
(use-package ansible-vault
  :ensure t
  :pin melpa-stable
  :defer t
  :init
  (setq ansible-vault-pass-file "~/.ansible-vault"))

(provide 'misc)
