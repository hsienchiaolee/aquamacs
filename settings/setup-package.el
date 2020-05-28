(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Setup commonly used packages early
(use-package hydra
  :ensure t
  :config
  (setq hydra-look-for-remap t)
  )

;; Keep package files clean
(use-package no-littering
  :ensure t
  :demand t
  :config
  (setq auto-save-file-name-transforms
    `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (setq backup-directory-alist
    `((".*" . ,(no-littering-expand-var-file-name "backup/"))))
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  )

(provide 'setup-package)
