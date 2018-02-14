(defmacro hot-buffer (name)
  `(lambda () (interactive) (switch-to-buffer ,name)))

(defmacro hot-file (name)
  `(lambda () (interactive)
     (find-file ,name)))

(define-key osx-key-mode-map [(alt /) ?s] (hot-buffer "*scratch*"))
(define-key osx-key-mode-map [(alt /) ?e] (hot-file "~/Library/Preferences/Aquamacs Emacs/Preferences.el"))
(define-key osx-key-mode-map [(alt /) ?b] (hot-file "~/.bashrc"))
(define-key osx-key-mode-map [(alt /) ?d] (hot-file "/d"))

(provide 'shortcut-file)
