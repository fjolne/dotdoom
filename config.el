;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Oleg Martynov"
      user-mail-address "fjolne.yngling@gmail.com")
(setq doom-font (font-spec :family "Iosevka" :size 18)
      doom-variable-pitch-font (font-spec :family "Open Sans" :size 18)
      doom-big-font (font-spec :family "Iosevka" :size 40))
(setq doom-theme
      (setq fj--default-theme 'doom-monokai-octagon))
(setq display-line-numbers-type 'relative)
(setq doom-localleader-key ","
      doom-localleader-alt-key "M-,")
(setq evil-want-fine-undo t)
(setq confirm-kill-emacs nil)
(setq company-idle-delay nil) ; do not show completion popup if not asked to
(setq evil-move-beyond-eol t) ; fix sexp movement
(setq which-key-allow-imprecise-window-fit nil) ; fix which-key popup
(doom-load-envvars-file "~/.doom.d/env")
(setq langtool-java-classpath (expand-file-name "~/.local/share/LanguageTool-5.9-stable/*"))

(map! "C-<escape>" #'evil-switch-to-windows-last-buffer
      :leader
      (:prefix-map ("e" . "flycheck")
                   "e" #'flycheck-explain-error-at-point
                   "n" #'flycheck-next-error
                   "p" #'flycheck-previous-error)
      (:prefix "g"
               (:when (modulep! :ui vc-gutter)
                 :desc "Popup hunk" "e" #'git-gutter:popup-hunk)))

(load! "big-font")
(load! "flutter")
(load! "org")
(load! "parens")
(load! "python")
(load! "rust")
(load! "scroll")
(load! "sessions")
(load! "vterm")
(load! "windows")
(load! "sql")
(load! "chatgpt")
(load! "copilot")
(load! "go")
