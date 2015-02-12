;; projectile
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; flymake-ruby
(require 'flymake-ruby)
(add-hook 'enh-ruby-mode-hook 'flymake-ruby-load)

;; robe
(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(defun disable-insert-encoding-tag () 
  (setq ruby-insert-encoding-magic-comment nil))

(add-hook 'enh-ruby-mode-hook 'disable-insert-encoding-tag)

;; company
(global-company-mode t)
(push 'company-robe company-backends)

(setq ruby-insert-encoding-magic-comment nil)
