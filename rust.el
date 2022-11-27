;;; rust.el -*- lexical-binding: t; -*-

(set-popup-rule! "^\\*cargo-test" :size 0.35 :quit t :select t)
(set-popup-rule! "^\\*cargo-run" :size 0.5 :quit t :select t)
(set-popup-rule! "^\\*rustic-compilation" :size 0.5 :quit t :select t)


(defun rust--save ()
  (interactive)
  (lsp-format-buffer)
  (projectile-save-project-buffers))

(map! :map rust-mode-map
      "C-s" #'rust--save)
