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

;; Setup Shell
(custom-set-variables
 ;; '(tramp-default-method "ssh")         ; uses ControlMaster
 '(comint-scroll-to-bottom-on-input t)    ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t)   ; scroll to show max possible output
 ;; '(comint-completion-autolist t)       ; show completion list when ambiguous
 '(comint-input-ignoredups t)             ; no duplicates in command history
 ;; '(comint-completion-addsuffix t)      ; insert space/slash after file completion
 '(comint-buffer-maximum-size 20000)      ; max length of the buffer in lines
 '(comint-prompt-read-only nil)           ; if this is t, it breaks shell-command
 '(comint-get-old-input (lambda () ""))   ; what to run when i press enter on a
                                        ; line above the current prompt
 '(comint-input-ring-size 5000)         ; max shell history size
 '(protect-buffer-bury-p nil)
 )
;; truncate buffers continuously
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

(provide 'shortcut-shell)

