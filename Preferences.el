(package-initialize)

;; Set path to dependencies
(setq settings-dir (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

;; setup interface and install packages early
(require 'setup-interface)
(require 'setup-package)

;; setup hydra early as it is used elsewhere
(require 'setup-hydra)

(require 'setup-helm)
(require 'setup-indents)
(require 'setup-macro)
(require 'setup-magit)
(require 'setup-modes)
(require 'setup-multiple-cursors)
(require 'setup-navigation)
(require 'setup-projectile)
(require 'setup-scala-mode)
(require 'shortcut-file)
(require 'shortcut-shell)
(require 'shortcut-timestamp)

(require 'misc)
(require 'utils)

;; start server
(server-start)
