;; flymake-ruby
(require 'flymake-ruby)
(add-hook 'enh-ruby-mode-hook 'flymake-ruby-load)

;; robe
(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
