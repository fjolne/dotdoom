;;; org.el -*- lexical-binding: t; -*-

(defun +org/save-and-export ()
  (interactive)
  (projectile-save-project-buffers)
  (org-hugo-export-wim-to-md))

(use-package! org
  :init
  (setq
   org-directory "~/org/"

   ;; Edit settings
   ;; org-auto-align-tags nil
   ;; org-tags-column 0
   ;; org-fold-catch-invisible-edits 'show-and-error
   ;; org-special-ctrl-a/e t
   ;; org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   ;;
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"

   ;; Agenda styling
   ;; org-agenda-tags-column 0
   ;; org-agenda-block-separator ?─
   ;; org-agenda-time-grid
   ;; '((daily today require-timed)
   ;;   (800 1000 1200 1400 1600 1800 2000)
   ;;   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   ;; org-agenda-current-time-string
   ;; "⭠ now ─────────────────────────────────────────────────"
   )
  :config
  ;; python
  (require 'ob-ein)
  (add-to-list 'org-babel-load-languages '(ein . t))

  (remove-hook!
    (org-mode markdown-mode rst-mode asciidoc-mode latex-mode LaTeX-mode)
    #'writegood-mode)

  (map! :mode org-mode
        "C-s" #'+org/save-and-export
        "C-j" #'org-next-visible-heading
        "C-k" #'org-previous-visible-heading
        "C-'" nil)
  (add-hook 'org-mode-hook #'auto-fill-mode)
  (global-org-modern-mode))
