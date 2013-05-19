emacs-visual-tweaks
===================

Personal tweaks to Emacs's appearance:
![Example](https://raw.github.com/katenym/emacs-visual-tweaks/master/example.png)
(Shown with the [M+ 1mn Light](http://mplus-fonts.sourceforge.jp/mplus-outline-fonts/design/index-en.html#mono) font.

#### color-theme-zenburn.el
  * Forked from an old version of https://github.com/bbatsov/zenburn-emacs
  * Minor color & weight changes:

```lisp
;; Tweak background greys
(defvar zenburn-bg-1 "#080808")
(defvar zenburn-bg "#2b2b2b")
(defvar zenburn-bg+1 "#3f3f3f")
(defvar zenburn-bg+2 "#4f4f4f")

;; within (defun color-theme-zenburn)
(trailing-whitespace ((t (:background ,zenburn-bg))))   ;; don't show trailing whitespace in red
(show-paren-match ((t (:foreground ,zenburn-blue-1))))  ;; get rid of bold weight on parens
```

#### visual-tweaks.el
  * Enables rainbow delimiters for easier visual matching
    https://github.com/jlr/rainbow-delimiters / http://www.emacswiki.org/emacs/RainbowDelimiters
  * Cranks up global font lock level, turns it on for all modes, and enables highlighting of selections
  * Does massive modeline cleanup & coloration based on http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html

