;;; org.el -*- lexical-binding: t; -*-

(map! :mode org-mode
      "C-j" #'org-next-visible-heading
      "C-k" #'org-previous-visible-heading)

(setq
 ;; Edit settings
 ;; org-auto-align-tags nil
 ;; org-tags-column 0
 ;; org-fold-catch-invisible-edits 'show-and-error
 ;; org-special-ctrl-a/e t
 ;; org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
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

(global-org-modern-mode)
