;;; ibuffer.el -*- lexical-binding: t; -*-

(remove-hook 'ibuffer-hook #'ibuffer-projectile-set-filter-groups)

(use-package! ibuffer-vc
  :hook (ibuffer . ibuffer-vc-set-filter-groups-by-vc-root))

(map! :map ibuffer-mode-map
      :n "gz" #'ibuffer-update)
