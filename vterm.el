;;; vterm.el -*- lexical-binding: t; -*-

(defvar vterm-history-ring nil)

(defun read-bash-history ()
  (let* ((text (f-read-text "~/.bash_history" ))
         (lines (split-string text "\n"))
         (commands (seq-remove (apply-partially #'string-prefix-p "#") lines)))
    (cdr (nreverse commands))))

(defun vterm-consult-history ()
  (interactive)
  (let* ((command (with-temp-buffer
                    (consult-history vterm-history-ring)
                    (buffer-string))))
    (message command)
    (vterm-insert command)))

(use-package! vterm
  :init
  (map!
   "C-'" #'+vterm/toggle)
  :config
  (require 'consult)
  (map! :map vterm-mode-map
        :ni "C-r" #'vterm-consult-history)
  (add-hook! 'vterm-mode-hook
    (defun vterm--sync-history ()
      (setq vterm-history-ring (read-bash-history)))))
