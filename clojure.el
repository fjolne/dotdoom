;;; clojure.el -*- lexical-binding: t; -*-

(add-hook! clojure-mode
           #'smartparens-strict-mode
           ;; #'evil-cleverparens-mode
           )

(setq clojure-toplevel-inside-comment-form t)

(after! cider
  (set-popup-rules!
   '(("^\\*cider-repl"
      :side right
      :width 100
      :quit nil
      :ttl nil))))

(unless evil-move-beyond-eol
  (advice-add 'cider-pprint-eval-last-sexp :around 'evil-collection-cider-last-sexp)
  (advice-add 'cider-pprint-eval-last-sexp-to-comment :around 'evil-collection-cider-last-sexp)
  (advice-add 'cider-pprint-eval-last-sexp-to-repl :around 'evil-collection-cider-last-sexp))


(defun cider-dev-reload (&optional arg)
  "(Re)loads namespaces and (re)starts mount states. With C-u, also resets database. "
  (interactive "P")
  (cider-interactive-eval (format "((requiring-resolve 'dev/reload) %s)"
                                  (--bool-str (eq 4 (car-safe arg))))))

(defun cider-dev-run-terms (&optional arg)
  "Runs 'bb dev:db' and 'bb dev:clj+cljs' in separate vterm buffers."
  (interactive "P")
  (vterm-run-cmd "bb dev:db")
  (vterm-run-cmd "bb dev:clj+cljs"))

(map! (:localleader
       (:map (clojure-mode-map clojurescript-mode-map clojurec-mode-map)
        "x" #'cider-connect-clj&cljs
        (:prefix ("u" . "user")
         "u" #'cider-dev-reload
         "t" #'cider-dev-run-terms)))

      (:map cider-mode-map
       :ni "M-<return>" #'cider-eval-sexp-at-point
       :ni "C-M-<return>" #'cider-eval-defun-at-point
       :ni "C-M-S-<return>" #'cider-pprint-eval-defun-at-point))
