;; ;;; flutter.el -*- lexical-binding: t; -*-

(set-popup-rule! "^\\*LSP Dart tests" :size 0.5 :quit t :select t)

(defun flutter--save ()
  (interactive)
  (lsp-format-buffer)
  (projectile-save-project-buffers)
  (flutter-hot-reload))

(map! :map dart-mode-map
      "C-s" #'flutter--save)

(setq lsp-dart-sdk-dir "/home/fjolne/src/flutter/bin/cache/dart-sdk")
