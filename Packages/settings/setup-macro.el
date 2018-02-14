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

(provide 'setup-macro)
