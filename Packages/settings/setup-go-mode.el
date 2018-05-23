;; Dependencies:
;; go get -u golang.org/x/tools/...
;; go get -u github.com/nsf/gocode
;; go get -u github.com/dougm/goflymake
;; go get -u github.com/rogpeppe/godef
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
    (setq tab-width 2)
    (setq compile-command "go build -v && go test -v && go vet")
    (define-key (current-local-map) (kbd "C-c C-c") 'compile)
    (go-eldoc-setup)
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (local-set-key [(alt b)] 'godef-jump)
    (add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
    (require 'go-flymake)
    (require 'go-flycheck)
    )
  (add-hook 'go-mode-hook 'go-mode-setup)

  (defhydra hydra-go-mode (:color teal
                           :hint nil)
"
     Playground                 Godef
---------------------------------------------------
 _p_: buffer                _d_: describe
 _P_: region to buffer      _j_: jump
 _A-p_: download entry      _J_: jump other window
"
    ("p"   go-play-buffer)
    ("P"   go-play-region)
    ("A-p" go-download-play)
    ("d"   godef-describe)
    ("j"   godef-jump)
    ("J"   godef-jump-other-window)
    ("q"   nil "cancel" :color blue))
  (define-key go-mode-map (kbd "C-c h") `hydra-go-mode/body)
  )

(use-package go-eldoc
  :ensure t
  :defer t)

(use-package company-go
  :ensure t
  :config
  (setq company-idle-delay .1)
  (setq company-begin-commands '(self-insert-command))
  (add-hook 'go-mode-hook 'company-mode)
  (add-hook 'go-mode-hook (lambda ()
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode)))
  )

(provide 'setup-go-mode)
