;;; parens.el -*- lexical-binding: t; -*-

(setq evil-move-cursor-back nil)
(setq evil-move-beyond-eol t)

(add-hook! 'smartparens-enabled-hook
           #'evil-smartparens-mode)

(defun sp-wrap-double-quotes ()
  (interactive)
  (sp-wrap-with-pair "\""))

(map! (:after smartparens
       :map smartparens-mode-map

       :mi "C-M-<right>"   #'sp-forward-sexp
       :mi "C-M-<left>"    #'sp-backward-sexp
       :mi "C-M-<up>"      #'sp-backward-up-sexp
       :mi "C-M-<down>"    #'sp-next-sexp

       :ni "C-M-s"         #'sp-splice-sexp
       :ni "C-M-S-s"       #'sp-split-sexp
       :ni "C-M-r"         #'sp-raise-sexp
       :ni "C-M-S-<right>" #'sp-forward-slurp-sexp
       :ni "C-M-S-<left>"  #'sp-forward-barf-sexp
       :ni "C-M-S-<down>"  #'sp-backward-barf-sexp
       :ni "C-M-S-<up>"    #'sp-backward-slurp-sexp
       :ni "C-M-("         #'sp-wrap-round
       :ni "C-M-{"         #'sp-wrap-curly
       :ni "C-M-["         #'sp-wrap-square
       :ni "C-M-\""        #'sp-wrap-double-quotes))
