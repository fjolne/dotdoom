;;; go.el -*- lexical-binding: t; -*-

(defun go--save-and-format ()
  (interactive)
  (gofmt)
  (save-buffer))

(map! :map go-mode-map
      "C-s" #'go--save-and-format)
