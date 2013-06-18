;;; ============= Emacs goodies ===========
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el")

;;; ============= Solarized ===============
(require 'color-theme)
(eval-after-load "color-theme"
 '(progn
	(color-theme-initialize)))
(add-to-list 'load-path "~/.dotfiles/solarized/emacs")
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;;; ============= Geiser ==================
(load-file "~/.emacs.d/geiser/elisp/geiser.el")

;;; ============= Quack ===================
(require 'quack)

;;; ============= Evil ====================
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)  
(evil-mode 1)

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)



