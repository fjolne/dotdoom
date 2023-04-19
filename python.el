;;; python.el -*- lexical-binding: t; -*-

(use-package! conda
  :init
  (setq conda--config `((envs_dirs . ["~/.conda/envs"])
                        (auto_activate_base . t))))

(defun python--save-and-format ()
  (interactive)
  (indent-region (point-min) (point-max))
  (save-buffer))

(map! :map python-mode-map
      "C-s" #'python--save-and-format)

;; (lsp-register-client
;;  (make-lsp-client :new-connection (lsp-tramp-connection "<binary name (e. g. pyls, rls)>")
;;                   :major-modes '(python-mode)
;;                   :remote? t
;;                   :server-id 'pyls-remote))
;;

(after! tramp
  (add-to-list 'tramp-remote-path "~/.emacs.d/.local/etc/lsp/npm/pyright/bin"))

(after! lsp-pyright
  (setq lsp-pyright-multi-root nil)
  (setq lsp-log-io t)
  (setq lsp-pyright-use-library-code-for-types t)
  (setq lsp-pyright-diagnostic-mode "workspace")
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-tramp-connection (lambda ()
                                            (cons "pyright-langserver"
                                                  lsp-pyright-langserver-command-args)))
    :major-modes '(python-mode)
    :remote? t
    :server-id 'pyright-remote
    :multi-root t
    :priority 3
    :initialization-options (lambda () (ht-merge (lsp-configuration-section "pyright")
                                                 (lsp-configuration-section "python")))
    :initialized-fn (lambda (workspace)
                      (with-lsp-workspace workspace
                        (lsp--set-configuration
                         (ht-merge (lsp-configuration-section "pyright")
                                   (lsp-configuration-section "python")))))
    :download-server-fn (lambda (_client callback error-callback _update?)
                          (lsp-package-ensure 'pyright callback error-callback))
    :notification-handlers (lsp-ht ("pyright/beginProgress" 'lsp-pyright--begin-progress-callback)
                                   ("pyright/reportProgress" 'lsp-pyright--report-progress-callback)
                                   ("pyright/endProgress" 'lsp-pyright--end-progress-callback))))
  )
