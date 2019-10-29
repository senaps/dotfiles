(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (deeper-blue)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(package-selected-packages (quote (multiple-cursors elpy))))
 '(tool-bar-mode nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; melpa packages!
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; elpy mode auto enable for python
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi")


;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; bind enter to indent in yaml files
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; line number auto
(global-linum-mode 1)

;; IDO mode
(require 'ido)
    (ido-mode t)

;; show the column and line number in minibuffer
(setq column-number-mode t)

;; disable startup screen
(setq inhibit-startup-screen t)

;;show matching parentheses
(show-paren-mode t)

;; elpy test runner is pytest
'(elpy-test-runner (quote elpy-test-pytest-runner))

;; use ipython
;;(elpy-use-ipython)


;; emmet mode! :)
(add-hook 'sgml-mode-hook 'emmet-mode);;auto start on any markup mode!
(setq emmet-move-cursor-between-quotes t) ;; cursor to first empty space!


;; autocomplete paired brackets
(electric-pair-mode 1)


;; winner mode allows me to go back to previues window setup
(when (fboundp 'winner-mode)
      (winner-mode 1))
; use C-1 for zoom, C-left for unzoom

;; multiple cursors
(require 'multiple-cursors)


;;
;; functions
;;

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)


;;
;; Key bindings
;;

(global-set-key (kbd "C-z") 'undo) ; undo
(global-set-key (kbd "C-Z") 'redo) ; redo
(global-set-key (kbd "C-i") 'mc/mark-next-like-this) ; add cursor on next line
(global-set-key (kbd "M-i") 'mc/mark-all-like-this) ; add cursor to all like selected word!
(global-set-key (kbd "C-M-y") 'duplicate-line)  
