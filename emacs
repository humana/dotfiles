;;; ============= SOLARIZED ================
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el")
(require 'color-theme)
(eval-after-load "color-theme"
 '(progn
	(color-theme-initialize)))
(add-to-list 'load-path "~/.dotfiles/solarized/emacs")
(require 'color-theme-solarized)
(color-theme-solarized-dark)
