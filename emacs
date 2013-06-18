;;; ============= Solarized ===============
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el")
(require 'color-theme)
(eval-after-load "color-theme"
 '(progn
	(color-theme-initialize)))
(add-to-list 'load-path "~/.dotfiles/solarized/emacs")
(require 'color-theme-solarized)
(color-theme-solarized-dark)


;;; ============= Geiser ==================
(load-file "~/.emacs.d/geiser/elisp/geiser.el")

;;; ============= Evil ====================
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)  
(evil-mode 1)

