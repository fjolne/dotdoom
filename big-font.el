;;; big-font.el -*- lexical-binding: t; -*-

(defun fj--load-theme (theme)
  (if (custom-theme-p theme)
      (enable-theme theme)
    (load-theme theme :no-confirm)))

(defun fj--big-font-mode ()
  (if doom-big-font-mode
      (progn
        (fj--load-theme 'doom-material-dark)
        (setq display-line-numbers nil))
    ;; doesn't work
    ;; (fj--load-theme fj--default-theme)
    (setq display-line-numbers display-line-numbers-type)))

;; (add-hook! 'doom-big-font-mode-hook #'fj--big-font-mode)
;; (remove-hook! 'doom-big-font-mode-hook #'fj--big-font-mode)
