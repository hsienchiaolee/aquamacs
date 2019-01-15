(define-key osx-key-mode-map [(alt m)] nil)
(use-package magit
  :ensure t
  :demand
  :init
  (setq magit-auto-revert-mode nil)
  :config
  (defhydra hydra-magit (:color teal :hint nil)
"
                   Magit

  Status        Changes           Rebase            Cherry Pick       Merge
--------------------------------------------------------------------------------------
_s_: status      _c_: commit        _r_: rebase          _p_: cherry pick    _m_: merge
_d_: diff        _C_: amend         _A-r_: continue      _A-p_: continue
_l_: log         _h_: reset        
_f_: reflog      _H_: reset hard

"
    ("s" magit-status)
    ("d" magit-diff)
    ("l" magit-log-current)
    ("f" magit-reflog)
    ("c" magit-commit)
    ("C" magit-commit-amend)
    ("h" magit-reset-head)
    ("H" magit-reset-hard)
    ("r" magit-rebase-interactive)
    ("A-r" magit-rebase-continue)
    ("p" magit-cherry-pick-popup)
    ("A-p" magit-sequencer-continue)
    ("m" magit-merge)
    ("q" nil "cancel" :color blue)
    ("RET" magit-visit-thing)
    )
  (global-set-key (kbd "A-m") 'hydra-magit/body)
  )

(provide 'setup-magit)
