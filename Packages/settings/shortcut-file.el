(defhydra hydra-file-shortcuts (:color teal
                                :columns 4)
  "files"
  ("s" (switch-to-buffer "*scratch*") "scratch" :exit t)
  ("e" (find-file "~/Library/Preferences/Aquamacs Emacs/Preferences.el") ".emacs" :exit t)
  ("b" (find-file "~/.bashrc") "bashrc" :exit t)
  ("D" (find-file "/d") "/d" :exit t)
  ("q" nil "quit" :color blue))
(global-set-key (kbd "A-/") 'hydra-file-shortcuts/body)

(provide 'shortcut-file)
