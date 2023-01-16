;;; sql.el -*- lexical-binding: t; -*-

;; (defvar sql-connection-alist nil)

;; (defmacro sql-specify-connections (&rest connections)
;;   "Set the sql-connection-alist from CONNECTIONS.
;; Generates respective interactive functions to establish each
;; connection."
;;   `(progn
;;      ,@(mapcar (lambda (conn)
;;    `(add-to-list 'sql-connection-alist ',conn))
;;         connections)
;;      ,@(mapcar (lambda (conn)
;;     (let* ((varname (car conn))
;;     (fn-name (intern (format "sql-connect-to-%s" varname)))
;;     (buf-name (format "*%s*" varname)))
;;       `(defun ,fn-name ,'()
;;          (interactive)
;;          (sql-connect ',varname ,buf-name))))
;;   connections)))

(use-package! sql
  :config
  (sql-set-product 'postgres))

(add-hook 'sql-mode-hook 'lsp)
(setq lsp-sqls-workspace-config-path "root")

(map! :map sql-mode-map
      :localleader
      (:prefix "e"
       :desc "Execute query" "e" #'lsp-sql-execute-query
       :desc "Execute paragraph" "d" #'lsp-sql-execute-paragraph))
(set-popup-rule! "^\\*sqls results\\*$" :size 0.5 :quit t :select t)
