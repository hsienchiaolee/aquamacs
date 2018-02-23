;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; vertical window split
(setq split-width-threshold 190)
(setq split-height-threshold nil)

;; theme
(use-package zenburn-theme
  :ensure t
  :config
  (setq default-frame-alist nil)
  (load-theme 'zenburn t))

;; zoom
(defhydra hydra-zoom (global-map "<f1>")
  "zoom"
  ("O" zoom-font-off "off")
  ("i" zoom-font "in")
  ("o" zoom-font-out "out"))

(provide 'setup-interface)
