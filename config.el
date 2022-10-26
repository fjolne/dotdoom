;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Oleg Martynov"
      user-mail-address "fjolne.yngling@gmail.com")
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 16))
(setq doom-theme 'doom-monokai-octagon)
(setq display-line-numbers-type t) ; or 'relative
(setq org-directory "~/org/")
(setq doom-localleader-key ","
      doom-localleader-alt-key "M-,")
(setq evil-want-fine-undo t)
(setq confirm-kill-emacs nil)
(setq company-idle-delay nil) ; do not show completion popup if not asked to
;; (setq evil-move-cursor-back nil)
(setq evil-move-beyond-eol t)
(setq which-key-allow-imprecise-window-fit nil)

(setq lsp-dart-sdk-dir "/home/fjolne/src/flutter/bin/cache/dart-sdk")

(map!
 "C-<escape>" #'evil-switch-to-windows-last-buffer)

(map! :leader
      (:prefix-map ("e" . "flycheck")
                   "e" #'flycheck-explain-error-at-point
                   "n" #'flycheck-next-error
                   "p" #'flycheck-previous-error))

(after! restclient (require 'gnutls))

(load! "windows")
(load! "vterm")
(load! "flutter")
(load! "parens")
(load! "sessions")
(load! "org")
(load! "scroll")
