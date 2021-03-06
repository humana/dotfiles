; make GC happen only every 20mbs
(setq gc-cons-threshold 20000000)

(prelude-require-packages '(solarized-theme evil evil-leader helm helm-projectile geiser sicp))


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
  "sfs" 'sp-forward-slurp-sexp
  "sbs" 'sp-backward-slurp-sexp
  "sfb" 'sp-forward-barf-sexp
  "sbb" 'sp-backward-barf-sexp
  "sk" 'sp-kill-sexp
  "su" 'sp-unwrap-sexp
)
(evil-leader/set-key-for-mode 'emacs-lisp-mode
  "ed" 'eval-defun
  "eb" 'eval-buffer
  "el" 'eval-last-sexp
)
(evil-leader/set-key-for-mode 'scheme-mode
  "ed" 'geiser-eval-definition
  "eb" 'geiser-eval-buffer
  "el" (lambda () (interactive) (save-excursion
         (unless (or (eobp) (eolp)) (forward-char))
                 (geiser-eval-last-sexp nil)))
  "hm" 'geiser-doc-look-up-manual
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

(define-key evil-normal-state-map "\C-n" 'evil-next-buffer)
(define-key evil-normal-state-map "\C-p" 'evil-prev-buffer)

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

; this package is not downloading from MEPLA, install manually
(require 'geiser)
(require 'quack)

;; geiser
(setq geiser-active-implementations '(racket))


;; smartparens
(setq sp-show-pair-from-inside t)

; disable flyspell-mode
(setq prelude-flyspell nil)
