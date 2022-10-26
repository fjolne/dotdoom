;;; sessions.el -*- lexical-binding: t; -*-

(load! "lisp/lib/sessions.el" doom-emacs-dir)

(defun restart-emacs (&optional _)
  (shell-command "systemctl --user restart emacs"))

(defun doom/restart ()
  (interactive)
  (restart-emacs))

(defun doom/restart-and-restore ()
  (interactive)
  (doom/quicksave-session)
  (save-some-buffers nil t)
  (letf! ((#'save-buffers-kill-emacs #'kill-emacs)
          (confirm-kill-emacs))
    (restart-emacs)))
