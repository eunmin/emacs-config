;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-show-error-buffer nil)

;; rainbow delemiter
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; clj-refactor
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))

;; cider auto-reload
(load-file "~/.emacs.d/cider-set-ns-and-eval-buffer/cider-set-ns-and-eval-buffer.el")
(require 'cider-set-ns-and-eval-buffer)
(global-set-key (kbd "C-c c") 'cider-set-ns-and-eval-buffer)

;; slamhound
(global-set-key (kbd "C-c O") 'slamhound)

;; toggle-camelcase-hyphen
(defun toggle-camelcase-hyphen ()
  "Toggle between camcelcase and underscore notation for the symbol at point."
  (interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'symbol))
           (start (car bounds))
           (end (cdr bounds))
           (currently-using-underscores-p (progn (goto-char start)
                                                 (re-search-forward "-" end t))))
      (if currently-using-underscores-p
          (progn
            (upcase-initials-region start end)
            (replace-string "-" "" nil start end)
            (downcase-region start (1+ start)))
        (replace-regexp "\\([A-Z]\\)" "-\\1" nil (1+ start) end)
        (downcase-region start end)))))

(global-set-key (kbd "C-c i") 'toggle-camelcase-hyphen)

;; midje
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)
