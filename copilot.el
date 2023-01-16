;;; copilot.el -*- lexical-binding: t; -*-

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-mode-map
         ("C-<tab>" . 'copilot-complete)
         ("<tab>" . 'copilot-accept-completion)
         :map copilot-completion-map
         ("C-<iso-lefttab>" . 'copilot-accept-completion-by-word)
         ("C-M-<iso-lefttab>" . 'copilot-accept-completion)
         ("C-M-<tab>" . 'copilot-accept-completion)
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)
         ("C-<tab>" . 'copilot-next-completion)))
