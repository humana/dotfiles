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

; font size
(set-default-font "consolas 14")

; sane ctrl-h
(define-key global-map "\C-h" 'backward-delete-char)

; smooth-scrolling like vim
(setq scroll-step             1
       scroll-conservatively  10000)
