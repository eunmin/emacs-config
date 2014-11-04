;; cask
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)

;; flymake-ruby
(require 'flymake-ruby)
(add-hook 'enh-ruby-mode-hook 'flymake-ruby-load)

;; projectile
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-remember-window-configs t)

  ;; ido
(require 'ido)
(ido-mode t)
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (defun ido-define-keys () ;; C-n/p is more intuitive in vertical
    ;; layout
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; rainbow delemiter
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; paredit
(require 'paredit)
(define-key paredit-mode-map (kbd "M-(") 'paredit-wrap-round)
(define-key paredit-mode-map (kbd "M-)") 'paredit-wrap-round-from-behind)
(define-key paredit-mode-map (kbd "M-s-8") 'paredit-wrap-square)
(define-key paredit-mode-map (kbd "M-s-9") 'paredit-wrap-square-from-behind)
(define-key paredit-mode-map (kbd "M-s-(") 'paredit-wrap-curly)
(define-key paredit-mode-map (kbd "M-s-)") 'paredit-wrap-curly-from-behind)
(define-key paredit-mode-map (kbd "C-w") 'paredit-kill-region-or-backward-word)
(define-key paredit-mode-map (kbd "C-M-<backspace>") 'backward-kill-sexp)

(add-hook 'paredit-mode-hook (lambda () (linum-mode 1)))

;; inf-ruby
;;(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
;;(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
;(add-hook 'ruby-mode-hook 'inf-ruby-console-auto)

;; robe
(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

;(add-hook 'robe-mode (inf-ruby-console-auto))

;; company
(global-company-mode t)
(push 'company-robe company-backends)

;; imenu-anywhere
(global-set-key (kbd "C-c o") 'imenu-anywhere)

(global-auto-revert-mode t)
