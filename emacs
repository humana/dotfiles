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

;;=============== Evil ====================
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)  

;;============= Evil-leader ===============
(add-to-list 'load-path "~/.emacs.d/evil-leader")
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
; must set global-evil-leader-mode before setting evil-mode
(evil-mode 1)

; leader keybindings
(evil-leader/set-key 
	"b" 'switch-to-buffer
	"f" 'find-file
	"k" 'kill-buffer
	"h" 'help-command
	)

;(define-key evil-normal-state-map (kbd "C-???") 'execute-extended-command)
;(define-key evil-visual-state-map (kbd "C-???") 'execute-extended-command)

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

; swap visual and physical line movement keys
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "gj") 'evil-next-line)
(define-key evil-normal-state-map (kbd "gk") 'evil-previous-line)


; font size
(set-default-font "consolas 14")

; sane ctrl-h
(define-key global-map "\C-h" 'backward-delete-char)

; smooth-scrolling like vim
(setq	scroll-step             1
		scroll-conservatively  10000
		redisplay-dont-pause	t 
	   )

(setq column-number-mode t) 
(setq line-number-mode t)
(setq indicate-empty-lines t)  
(setq size-indication-mode t) 
(setq visible-bell t)         ; no beeping

;;; ============= Powerline ====================
(add-to-list 'load-path "~/.emacs.d/powerline")
(require 'powerline)
(powerline-center-evil-theme)

;;; ============= Surround =====================
(add-to-list 'load-path "~/.emacs.d/evil-surround")
(require 'surround)
(global-surround-mode 1)

;; show paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)

;; use y / n instead of yes / no
(fset 'yes-or-no-p 'y-or-n-p)

;; enter emacs state in insert mode }:)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
; remap some of the vim insert state keys back (evil-maps.el)
(define-key evil-insert-state-map "\C-o" 'evil-execute-in-normal-state)
(define-key evil-insert-state-map "\C-r" 'evil-paste-from-register)
(define-key evil-insert-state-map "\C-y" 'evil-copy-from-above)
(define-key evil-insert-state-map "\C-e" 'evil-copy-from-below)
(define-key evil-insert-state-map "\C-n" 'evil-complete-next)
(define-key evil-insert-state-map "\C-p" 'evil-complete-previous)
(define-key evil-insert-state-map "\C-x\C-n" 'evil-complete-next-line)
(define-key evil-insert-state-map "\C-x\C-p" 'evil-complete-previous-line)
(define-key evil-insert-state-map "\C-t" 'evil-shift-right-line)
(define-key evil-insert-state-map "\C-d" 'evil-shift-left-line)



