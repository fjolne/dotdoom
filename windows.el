;;; windows.el -*- lexical-binding: t; -*-
;;;

(defun fj--kill-frame ()
  (interactive)
  (vterm-send-C-d)
  (delete-frame))

(map! :map general-override-mode-map
      "M-<right>" #'evil-window-right
      "M-<left>" #'evil-window-left
      "M-<up>" #'evil-window-up
      "M-<down>" #'evil-window-down
      "M-l" #'evil-window-increase-width
      "M-h" #'evil-window-decrease-width
      "M-j" #'evil-window-increase-height
      "M-k" #'evil-window-decrease-height
      "C-S-w" #'+workspace/delete
      "C-S-q" #'fj--kill-frame
      )
