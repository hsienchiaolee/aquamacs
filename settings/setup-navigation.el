;; disable reuse dired buffer
(put 'dired-find-alternate-file 'disabled nil)

;; zoom
(defhydra hydra-zoom (:color teal
                      :hint nil)
"
     Zoom
---------------
_o_: out
_i_: in
_O_: off

"
  ("i" zoom-font :exit nil)
  ("o" zoom-font-out :exit nil)
  ("O" zoom-font-off)
  ("q" nil "cancel" :color blue))
(global-set-key (kbd "C-> z") `hydra-zoom/body)

;; registers
(global-set-key [(alt j)] 'jump-to-register)
(global-set-key [(alt k)] 'point-to-register)
(global-set-key [(alt meta j)] 'insert-register)
(global-set-key [(alt meta k)] 'copy-to-register)

;; ace
(use-package ace-window
  :ensure t
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind ("C-x o" . ace-window))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-." . ace-jump-mode))

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

(global-set-key [(meta alt up)]  'move-line-region-up)
(global-set-key [(meta alt down)]  'move-line-region-down)

(global-set-key [(alt \\) ?k] 'keep-lines)
(global-set-key [(alt \\) ?d] 'delete-matching-lines)
(global-set-key [(alt \\) ?t] 'toggle-truncate-lines)
(add-hook 'text-mode-hook '(lambda () (visual-line-mode)))

;; buffer
(use-package buffer-move
  :ensure t
  :init
  (global-set-key [(meta alt left)] 'buf-move-left)
  (global-set-key [(meta alt right)] 'buf-move-right)
  )
(global-set-key [(alt t)] 'new-empty-buffer)
(global-set-key [(alt r)] 'revert-buffer)
(global-set-key [(alt q)] 'erase-buffer)

(global-set-key [(ctrl right)] 'next-buffer)
(global-set-key [(ctrl left)] 'previous-buffer)

;; Disable save-buffer-kill-terminal command
(global-set-key (kbd "C-x C-c") nil)

(provide 'setup-navigation)
