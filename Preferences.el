;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default py-indent-offset 2)
(setq-default css-indent-offset 2)
(setq-default c-basic-offset 2)
(setq-default js2-basic-offset 2) ; same as tab-width
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
(defun install-package (x)
  (when (not (package-installed-p x)) (package-install x)))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(install-package 'rust-mode)
(install-package 'scala-mode2)
(install-package 'magit)
(install-package 'git-commit-mode)
(install-package 'git-rebase-mode)

;; shell
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
  `(lambda () (interactive) (find-file ,name)))

(define-key osx-key-mode-map [(alt /) ?s] (hot-buffer "*scratch*"))
(define-key osx-key-mode-map [(alt /) ?e] (hot-file "~/Library/Preferences/Aquamacs Emacs/Preferences.el"))
(define-key osx-key-mode-map [(alt /) ?b] (hot-file "~/.bashrc"))

;; text
(defmacro hot-text (x)
  `(lambda () (interactive) (insert ,x)))

;; registers
(define-key osx-key-mode-map [(alt j)] 'jump-to-register)
(define-key osx-key-mode-map [(alt k)] 'point-to-register)

;; lines
(define-key osx-key-mode-map [(alt \\) ?k] 'keep-lines)
(define-key osx-key-mode-map [(alt \\) ?d] 'delete-matching-lines)
(define-key osx-key-mode-map [(alt \\) ?t] 'toggle-truncate-lines)

;; buffer
(define-key osx-key-mode-map [(alt r)] 'revert-buffer)
(define-key osx-key-mode-map [(alt q)] 'erase-buffer)

;; macro
(define-key osx-key-mode-map [(alt \()] 'kmacro-start-macro)
(define-key osx-key-mode-map [(alt \))] 'kmacro-end-macro)
(define-key osx-key-mode-map [(alt \\) ?a] 'apply-macro-to-region-lines)

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

;; start server
(server-start)