;;; parens.el -*- lexical-binding: t; -*-

(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode)
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
      "M-C-r" #'sp-raise-sexp
      "M-C-s" #'sp-splice-sexp)


'("C-M-f" #'sp-forward-sexp
  "C-M-b" #'sp-backward-sexp
  "C-M-u" #'sp-backward-up-sexp
  "C-M-d" #'sp-down-sexp
  "C-M-p" #'sp-backward-down-sexp
  "C-M-n" #'sp-up-sexp
  "M-s" #'sp-splice-sexp
  "M-<up>" #'sp-splice-sexp-killing-backward
  "M-<down>" #'sp-splice-sexp-killing-forward
  "M-r" #'sp-splice-sexp-killing-around
  "M-(" #'sp-wrap-round
  "C-)" #'sp-forward-slurp-sexp
  "C-<right>" #'sp-forward-slurp-sexp
  "C-}" #'sp-forward-barf-sexp
  "C-<left>" #'sp-forward-barf-sexp
  "C-(" #'sp-backward-slurp-sexp
  "C-M-<left>" #'sp-backward-slurp-sexp
  "C-{" #'sp-backward-barf-sexp
  "C-M-<right>" #'sp-backward-barf-sexp
  "M-S" #'sp-split-sexp
  "M-j" #'sp-join-sexp
  "M-?" #'sp-convolute-sexp
  "C-M-f" #'sp-forward-sexp
  "C-M-b" #'sp-backward-sexp
  "C-M-d" #'sp-down-sexp
  "C-M-a" #'sp-backward-down-sexp
  "C-S-d" #'sp-beginning-of-sexp
  "C-S-a" #'sp-end-of-sexp
  "C-M-e" #'sp-up-sexp
  "C-M-u" #'sp-backward-up-sexp
  "C-M-n" #'sp-next-sexp
  "C-M-p" #'sp-previous-sexp
  "C-M-k" #'sp-kill-sexp
  "C-M-w" #'sp-copy-sexp
  "M-<delete>" #'sp-unwrap-sexp
  "M-<backspace>" #'sp-backward-unwrap-sexp
  "C-<right>" #'sp-forward-slurp-sexp
  "C-<left>" #'sp-forward-barf-sexp
  "C-M-<left>" #'sp-backward-slurp-sexp
  "C-M-<right>" #'sp-backward-barf-sexp
  "M-D" #'sp-splice-sexp
  "C-M-<delete>" #'sp-splice-sexp-killing-forward
  "C-M-<backspace>" #'sp-splice-sexp-killing-backward
  "C-S-<backspace>" #'sp-splice-sexp-killing-around
  "C-]" #'sp-select-next-thing-exchange
  "C-M-]" #'sp-select-next-thing
  "C-M-SPC" #'sp-mark-sexp
  "M-F" #'sp-forward-symbol
  "M-B" #'sp-backward-symbol)
