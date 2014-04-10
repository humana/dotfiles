; make GC happen only every 20mbs
(setq gc-cons-threshold 20000000)

(prelude-require-packages '(solarized-theme evil evil-leader helm helm-projectile))


(load-theme 'solarized-dark t)

;;============= Evil-leader ===============
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
	"m" 'helm-projectile
	)

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

; remap c-h to be backspace
(keyboard-translate ?\C-h ?\C-?)

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

;;; ============= Helm =====================
;(helm-mode 1)
;
;

; file extension preferences
(setq ido-file-extensions-order '(".pl" ".java" ".js" ".txt" ".xml" ".el" ))

(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

; (require 'geiser)
(require 'quack)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9370aeac615012366188359cb05011aea721c73e1cb194798bc18576025cabeb" default)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#073642" . 0) ("#546E00" . 20) ("#00736F" . 30) ("#00629D" . 50) ("#7B6000" . 60) ("#8B2C02" . 70) ("#93115C" . 85) ("#073642" . 100))))
 '(magit-diff-use-overlays nil)
 '(weechat-color-list (quote (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
