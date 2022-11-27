;;; python.el -*- lexical-binding: t; -*-

(use-package! conda
  :init
  (setq conda--config `((envs_dirs . ["~/.conda/envs"])
                        (auto_activate_base . t))))
