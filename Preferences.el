;; vertical window split
(setq split-width-threshold nil)

;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default py-indent-offset 2)
(setq-default css-indent-offset 2)
(setq-default c-basic-offset 2)
(setq-default js2-basic-offset 2)
(setq-default javascript-indent-level 2)
(setq-default js-indent-level 2)
(setq-default scala-indent-level 2)
(custom-set-variables
 '(python-guess-indent nil)
 '(python-indent 2))

;; auto complete
(setq-default completion-ignore-case t)
(setq-default pcomplete-ignore-case t)

;; disable shell echo
(setq comint-process-echoes t)
(put 'erase-buffer 'disabled nil)

;; packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

;; Lisp defun
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; shell
(add-to-list 'display-buffer-alist
             '("^\\*shell\\*$" . (display-buffer-same-window)))

(defun shell-named (name)
  (shell)
  (rename-buffer name)
  (process-kill-without-query (get-buffer-process name)))

(defmacro hot-shell (name)
  `(lambda () (interactive)
     (if (get-buffer ,name) (switch-to-buffer ,name)
       (shell-named ,name))))

(defmacro hot-buffer (name)
  `(lambda () (interactive) (switch-to-buffer ,name)))

(global-set-key [(meta ?1)] (hot-shell "*shell1*"))
(global-set-key [(meta ?2)] (hot-shell "*shell2*"))
(global-set-key [(meta ?3)] (hot-shell "*shell3*"))
(global-set-key [(meta ?4)] (hot-shell "*shell4*"))
(global-set-key [(meta ?5)] (hot-shell "*shell5*"))
(global-set-key [(meta ?6)] (hot-shell "*shell6*"))
(global-set-key [(meta ?7)] (hot-shell "*shell7*"))
(global-set-key [(meta ?8)] (hot-shell "*shell8*"))
(global-set-key [(meta ?9)] (hot-shell "*shell9*"))
(global-set-key [(meta ?0)] (hot-shell "*shell0*"))

;; files
(defmacro hot-file (name)
  `(lambda () (interactive)
     (find-file ,name)))

(define-key osx-key-mode-map [(alt /) ?s] (hot-buffer "*scratch*"))
(define-key osx-key-mode-map [(alt /) ?e] (hot-file "~/Library/Preferences/Aquamacs Emacs/Preferences.el"))
(define-key osx-key-mode-map [(alt /) ?b] (hot-file "~/.bashrc"))

;; text
(defmacro hot-text (x)
  `(lambda () (interactive) (insert ,x)))

;; registers
(define-key osx-key-mode-map [(alt j)] 'jump-to-register)
(define-key osx-key-mode-map [(alt k)] 'point-to-register)
(define-key osx-key-mode-map [(alt meta j)] 'insert-register)
(define-key osx-key-mode-map [(alt meta k)] 'copy-to-register)

;; helm
(use-package helm
  :ensure t
  :init
  (setq helm-ff-file-name-history-use-recentf t)
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files))
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  )

;; magit
(define-key osx-key-mode-map [(alt m)] nil)
(use-package magit
  :ensure t
  :init
  (setq magit-auto-revert-mode nil)
  :bind (("A-m s" . magit-status)
         ("A-m d" . magit-diff)
         ("A-m c" . magit-commit)
         ("A-m C" . magit-commit-amend)
         ("A-m r" . magit-rebase-interactive)
         ("A-m m" . magit-merge)
         ("A-m l" . magit-log-current))
  )

;; Lines
(defun move-line (n)
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    (forward-line -1)
    (forward-char col)))

(defun move-region (start end n)
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-line-up (n)
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun move-region-up (start end n)
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(defun move-line-region-up (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-up start end n) (move-line-up n)))

(defun move-line-region-down (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-down start end n) (move-line-down n)))

(define-key osx-key-mode-map [(meta alt up)]  'move-line-region-up)
(define-key osx-key-mode-map [(meta alt down)]  'move-line-region-down)

(define-key osx-key-mode-map [(alt \\) ?k] 'keep-lines)
(define-key osx-key-mode-map [(alt \\) ?d] 'delete-matching-lines)
(define-key osx-key-mode-map [(alt \\) ?t] 'toggle-truncate-lines)

;; buffer
(use-package buffer-move
  :ensure t
  :init
  (define-key osx-key-mode-map [(meta alt left)] 'buf-move-left)
  (define-key osx-key-mode-map [(meta alt right)] 'buf-move-right)
  )
(define-key osx-key-mode-map [(alt t)] 'new-empty-buffer)
(define-key osx-key-mode-map [(alt r)] 'revert-buffer)
(define-key osx-key-mode-map [(alt q)] 'erase-buffer)

(define-key osx-key-mode-map [(ctrl right)] 'next-buffer)
(define-key osx-key-mode-map [(ctrl left)] 'previous-buffer)

;; macro
(defun apply-named-macro-to-region-lines (top bottom)
  "Apply named keyboard macro to all lines in the region."
  (interactive "r")
  (let ((macro (intern
                (completing-read "kbd macro (name): "
                                 obarray
                                 (lambda (elt)
                                   (and (fboundp elt)
                                        (or (stringp (symbol-function elt))
                                            (vectorp (symbol-function elt))
                                            (get elt 'kmacro))))
                                 t))))
    (apply-macro-to-region-lines top bottom macro)))

(define-key osx-key-mode-map [(alt \()] 'kmacro-start-macro)
(define-key osx-key-mode-map [(alt \))] 'kmacro-end-macro)
(define-key osx-key-mode-map [(alt \\) ?a] 'apply-macro-to-region-lines)
(define-key osx-key-mode-map [(alt \\) ?s] 'name-last-kbd-macro)
(define-key osx-key-mode-map [(alt \\) ?n] 'apply-named-macro-to-region-lines)

;; compiling
(global-set-key [(meta ?`)] 'compile)
(global-set-key [(meta ?~)] 'next-error)
(global-set-key [(control meta ?~)] 'first-error)

;; replace string
(define-key osx-key-mode-map [(meta alt f)] 'replace-string)

;; duplicate line
(defun duplicate-line ()
  (interactive)
  (let ((text (buffer-substring (line-beginning-position) (line-end-position))))
    (move-end-of-line 1)
    (newline)
    (insert text)))
(define-key osx-key-mode-map [(alt p)] 'duplicate-line)

;; time stamp
(defun insert-day-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y-%m-%d" (current-time))))
(define-key osx-key-mode-map [(alt ?-)] 'insert-day-stamp)

(defun insert-compact-day-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y%m%d" (current-time))))
(define-key osx-key-mode-map [(meta ?-)] 'insert-compact-day-stamp)

(defun insert-time-stamp ()
  (interactive "*")
  (insert (format-time-string "%Y%m%d-%H%M%S" (current-time))))
(define-key osx-key-mode-map [(alt ?_)] 'insert-time-stamp)
(put 'downcase-region 'disabled nil)

;; tramp
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
(define-key osx-key-mode-map [(alt \\) ?T] 'tramp-cleanup-all-connections)

;; ensime
(use-package ensime
  :ensure t
  :defer t
  :init
  (add-to-list 'exec-path "/opt/local/bin")
  :config
  (setq ensime-startup-snapshot-notification nil)
  (setq ensime-startup-notification nil)
  )

;; multi cursor
(use-package multiple-cursors
  :ensure t
  :bind (("C-c C-s" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  )

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

;; start server
(server-start)
