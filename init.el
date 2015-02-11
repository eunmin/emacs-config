;; cask
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)

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

;; company
(global-company-mode t)
(push 'company-robe company-backends)

;; imenu-anywhere
(global-set-key (kbd "C-c o") 'imenu-anywhere)

(global-auto-revert-mode t)

;; disable truncate-lines
(visual-line-mode -1)
(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

;; scrolling
(setq scroll-step 1 scroll-conservatively 10000)
(global-set-key [up] (lambda () (interactive) (scroll-down 1)))
(global-set-key [down] (lambda () (interactive) (scroll-up 1)))
(global-set-key [left] (lambda () (interactive) (scroll-right tab-width t)))
(global-set-key [right] (lambda () (interactive) (scroll-left tab-width t)))

;; disable line hightlight
(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (hl-line-mode -1)
            (global-hl-line-mode -1))
          't)

;; show line number

;; javascript tab
(setq js-indent-level 2)

;; evil
(require 'evil)
(global-set-key (kbd "M-n") 'evil-search-word-forward)
(global-set-key (kbd "M-p") 'evil-search-word-backward)

;; theme-load
(load-theme 'zenburn t)

(load-file "~/.emacs.d/ruby.el")
(load-file "~/.emacs.d/clojure.el")

(setq ruby-insert-encoding-magic-comment nil)

(defun revert-buffer-with-coding-system-no-confirm (coding-system &optional force)
  (interactive "zCoding system for visited file (default nil): \nP")
  (check-coding-system coding-system)
  (if (and coding-system buffer-file-coding-system (null force))
      (setq coding-system
            (merge-coding-systems coding-system buffer-file-coding-system)))
  (let ((coding-system-for-read coding-system))
    (revert-buffer t t)))

(defun revert-buffer-with-utf8 ()
  (interactive)
  (revert-buffer-with-coding-system-no-confirm 'utf-8))

(global-set-key (kbd "C-c u") 'revert-buffer-with-utf8)

;; set active background color

;; android
(load-file "~/.emacs.d/android.el")
