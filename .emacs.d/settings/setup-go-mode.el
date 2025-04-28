;; Dependencies:
;; go install golang.org/x/tools/gopls@latest
(use-package lsp-mode
  :ensure t
  ;; uncomment to enable gopls http debug server
  ;; :custom (lsp-gopls-server-args '("-debug" "127.0.0.1:0"))
  :commands (lsp lsp-deferred)
  :config
  (progn
    ;; use flycheck, not flymake
    (setq lsp-prefer-flymake nil)
    )
  )

;; optional - provides fancy overlay information
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (progn
    ;; disable inline documentation
    (setq lsp-ui-sideline-enable nil)
    ;; disable showing docs on hover at the top of the window
    (setq lsp-ui-doc-enable nil)
    )
  )

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (progn
    ;; don't add any dely before trying to complete thing being typed
    ;; the call/response to gopls is asynchronous so this should have little
    ;; to no affect on edit latency
    (setq company-idle-delay 0.1)
    ;; start completing after a single character instead of 3
    (setq company-minimum-prefix-length 1)
    ;; align fields in completions
    (setq company-tooltip-align-annotations t)
    )
  )

;; optional package to get the error squiggles as you edit
(use-package flycheck
  :ensure t)

(use-package go-mode
  :ensure t
  :bind (
         ;; If you want to switch existing go-mode bindings to use lsp-mode/gopls instead
         ;; uncomment the following lines
         ;; ("C-c C-j" . lsp-find-definition)
         ;; ("C-c C-d" . lsp-describe-thing-at-point)
         )
  :hook ((go-mode . lsp-deferred)
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports))
  :config
  (defhydra hydra-go-mode (:color teal
                           :hint nil)
"
     Playground                 Godef
---------------------------------------------------
 _p_: buffer                _d_: describe
 _P_: region to buffer      _j_: jump
 _s-p_: download entry      _J_: jump other window
"
    ("p"   go-play-buffer)
    ("P"   go-play-region)
    ("s-p" go-download-play)
    ("d"   godef-describe)
    ("j"   godef-jump)
    ("J"   godef-jump-other-window)
    ("q"   nil "cancel" :color blue))
  (define-key go-mode-map (kbd "C-c h") `hydra-go-mode/body)
  )

(provide 'setup-go-mode)
