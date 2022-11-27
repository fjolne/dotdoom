;;; parens.el -*- lexical-binding: t; -*-

(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'evil-smartparens-mode)
(setq clojure-toplevel-inside-comment-form t)

(defun sp-wrap-single-quote ()
  (interactive)
  (sp-wrap-with-pair "'"))

(defun sp-wrap-double-quote ()
  (interactive)
  (sp-wrap-with-pair "\""))

(defun sp-wrap-angle ()
  (interactive)
  (sp-wrap-with-pair "<"))

(sp-local-pair '(dart-mode) "<" ">")

(map! :map smartparens-mode-map
      "M-C-<right>" #'sp-forward-sexp
      "M-C-<left>" #'sp-backward-sexp
      "M-S-<right>" #'sp-forward-slurp-sexp
      "M-S-<left>" #'sp-forward-barf-sexp
      "M-S-C-<left>" #'sp-backward-slurp-sexp
      "M-S-C-<right>" #'sp-backward-barf-sexp
      "M-C-(" #'sp-wrap-round
      "M-C-{" #'sp-wrap-curly
      "M-C-[" #'sp-wrap-square
      "M-C-'" #'sp-wrap-single-quote
      "M-C-\"" #'sp-wrap-double-quote
      "M-C-<" #'sp-wrap-angle
      "M-C-r" #'sp-raise-sexp
      "M-C-s" #'sp-splice-sexp
      "M-C-S-s" #'sp-split-sexp)
