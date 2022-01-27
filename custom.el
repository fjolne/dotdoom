(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval progn
           (defun --bool-str
               (bool)
             (if bool "true" "false"))
           (defun cider-dev-reload
               (&optional reset-db)
             "(Re)loads namespaces and (re)starts mount states. With C-u, also resets database. "
             (interactive "P")
             (cider-interactive-eval
              (format "((requiring-resolve 'dev/reload) %s)"
                      (--bool-str
                       (eq 4
                           (car-safe reset-db))))))
           (map!
            (:localleader
             (:map
              (clojure-mode-map clojurescript-mode-map clojurec-mode-map)
              (:prefix
               ("s" . "custom")
               "s" #'cider-dev-reload)))))
     (eval progn
           (defun --bool-str
               (bool)
             (if bool "true" "false"))
           (defun cider-dev-reload
               (&optional reset-db)
             "(Re)loads namespaces and (re)starts mount states. With C-u, also resets database. "
             (interactive "P")
             (cider-interactive-eval
              (format "((requiring-resolve 'dev/reload) %s)"
                      (-bool-str
                       (eq 4
                           (car-safe reset-db))))))
           (map!
            (:localleader
             (:map
              (clojure-mode-map clojurescript-mode-map clojurec-mode-map)
              (:prefix
               ("s" . "custom")
               "s" #'cider-dev-reload)))))
     (eval progn
           (defun --bool-str
               (bool)
             (if bool "true" "false"))
           (defun --cider-dev-reload
               (&optional reset-db)
             "(Re)loads namespaces and (re)starts mount states. With C-u, also resets database. "
             (interactive "P")
             (cider-interactive-eval
              (format "((requiring-resolve 'dev/reload) %s)"
                      (-bool-str
                       (eq 4
                           (car-safe reset-db))))))
           (map!
            (:localleader
             (:map
              (clojure-mode-map clojurescript-mode-map clojurec-mode-map)
              (:prefix
               ("s" . "custom")
               "r" #'--cider-dev-reload))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
