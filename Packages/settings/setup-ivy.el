(use-package ivy
  :ensure t
  :custom
  (ivy-count-format "(%d/%d) ")
  :init
  (ivy-mode 1)
  :config
  (define-key ivy-minibuffer-map (kbd "C-n") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-P") 'ivy-previous-line)
  (define-key ivy-minibuffer-map [remap kill-whole-visual-line] 'ivy-kill-whole-line)
  )

(use-package counsel
  :ensure t
  :demand t
  :config
  (counsel-mode 1))

(use-package swiper
  :ensure t
  :config
  (define-key osx-key-mode-map [remap aquamacs-isearch-forward] 'swiper)
  ;; Disable A-g to prevent using isearch
  (define-key osx-key-mode-map [(alt g)] 'nil)
  )

(provide 'setup-ivy)
