;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Oleg Martynov"
      user-mail-address "fjolne.yngling@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 24 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Inter" :size 28))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

;; (setq doom-localleader-key ",")
;; (setq doom-localleader-alt-key "M-,")

(use-package! good-scroll
  :config
  (good-scroll-mode +1))

(map! :nvi "C-,"   #'good-scroll-up
      :nvi "C-."   #'good-scroll-down
      :nvi [next]  #'good-scroll-up-full-screen
      :nvi [prior] #'good-scroll-down-full-screen)

(defun browse-url-wslview (url &optional _new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (let* ((url (browse-url-encode-url url))
         (process-environment (browse-url-process-environment)))
    (start-process
     (concat "wslview " url) nil
     "wslview"
     url)))

(setq browse-url-browser-function #'browse-url-wslview)

(map! :leader
      (:prefix "g"
       (:when (featurep! :ui vc-gutter)
        :desc "Popup hunk" "e" #'git-gutter:popup-hunk)))

(defun treemacs--select-visible-window- (&rest _)
  (treemacs--select-visible-window))

(advice-add 'treemacs-find-file :after #'treemacs--select-visible-window-)

(defun vterm-run-cmd (cmd &optional cmd-buffer-name)
  (let* ((name (or cmd cmd-buffer-name))
         (existing-vterm-buffer (get-buffer name)))
    (with-current-buffer (or existing-vterm-buffer
                             (+vterm/here nil))
      (if existing-vterm-buffer
          (vterm-send-C-c)
        (rename-buffer name))
      (vterm-send-string cmd)
      (vterm-send-return))))

(defun --bool-str (bool)
  (if bool "true" "false"))

(setq company-idle-delay nil)

(map! :nvi "C-M-w" #'er/expand-region)

(load! "parens.el")
(load! "clojure.el")
(load! "ibuffer.el")
