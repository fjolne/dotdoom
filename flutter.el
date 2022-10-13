;; ;;; flutter.el -*- lexical-binding: t; -*-


;; (defun flutter--on-save ()
;;   (add-hook 'after-save-hook
;;             #'flutter-hot-reload
;;             0 t))

;; (add-hook 'flutter-mode-hook
;;           #'flutter--on-save)

(defun flutter--save ()
  (interactive)
  (lsp-format-buffer)
  (projectile-save-project-buffers)
  (flutter-hot-reload))

(map! :map dart-mode-map
      "C-s" #'flutter--save)
