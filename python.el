;;; python.el -*- lexical-binding: t; -*-

(setq lsp-pyright-multi-root nil)

(use-package! conda
  :init
  (setq conda--config `((envs_dirs . ["~/.conda/envs"])
                        (auto_activate_base . t))))

(defun python--save-and-format ()
  (interactive)
  (indent-region (point-min) (point-max))
  (save-buffer))

(map! :map python-mode-map
      "C-s" #'python--save-and-format)
