;;; windows.el -*- lexical-binding: t; -*-
;;;

(defun fj--kill-frame ()
  (interactive)
  (when (fboundp 'vterm-send-C-d)
    (vterm-send-C-d))
  (delete-frame))

(map! :map general-override-mode-map

      :n "C-S-t" #'+workspace/new
      "C-S-M-t" #'+workspace/display
      "C-S-w" #'+workspace/delete
      "C-S-q" #'fj--kill-frame
      "C-s-<right>" #'+workspace/switch-right
      "C-s-<left>" #'+workspace/switch-left

      "M-s-<right>" #'evil-window-right
      "M-s-<left>" #'evil-window-left
      "M-s-<up>" #'evil-window-up
      "M-s-<down>" #'evil-window-down

      "M-l" #'evil-window-increase-width
      "M-h" #'evil-window-decrease-width
      "M-j" #'evil-window-increase-height
      "M-k" #'evil-window-decrease-height
      )
