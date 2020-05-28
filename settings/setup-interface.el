;; Font
(set-face-attribute 'default nil
                    :family "Menlo"
                    :height 120)
(set-face-attribute 'fixed-pitch nil
                    :family 'unspecified
                    :inherit 'default)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tabbar-mode) (tabbar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; vertical window split
(setq split-width-threshold 190)
(setq split-height-threshold nil)

;; Line wrap indicator
(setq-default visual-line-fringe-indicators '(left-curly-arrow nil))

(provide 'setup-interface)
