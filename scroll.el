;;; scroll.el -*- lexical-binding: t; -*-

(defun good-scroll-down-half-screen ()
  (interactive)
  (good-scroll-move (- (/ (good-scroll--window-usable-height) 2))))

(defun good-scroll-up-half-screen ()
  (interactive)
  (good-scroll-move (/ (good-scroll--window-usable-height) 2)))

(setq good-scroll-duration 0.3)
(good-scroll-mode 1)
(map!
 "C-S-d" #'good-scroll-up-half-screen
 "C-S-u" #'good-scroll-down-half-screen)
