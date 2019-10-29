(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (try which-key use-package multiple-cursors elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq inhibit-startup-message t)  ;; disable startup
(tool-bar-mode -1)		  ; disable the toolbar

;;
;; packages
;;
;; melpa packages!
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; package manager
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; try packages before installing them
(use-package try
	     :ensure t)

;; which key did i want to use?
(use-package which-key
	     :ensure t
	     :config (which-key-mode))


;;
;; system Configs
;;

;; line number auto
(global-linum-mode 1)

; enable keyword matching so it will ignore mis-spelling commands
(setq indo-enable-flex-matching t)

;; IDO mode
(ido-mode 1)
;;(setq ido-everywhere t)
;; show the column and line number in minibuffer
(setq column-number-mode t)
;; disable startup screen
(setq inhibit-startup-screen t)
;;show matching parentheses
(show-paren-mode t)
(defalias 'list-buffers 'libuffer)
;; autocomplete paired brackets
(electric-pair-mode 1)

;; winner mode allows me to go back to previues window setup
(winner-mode 1)
(when (fboundp 'winner-mode)
      (winner-mode 1))
; use C-1 for zoom, C-left for unzoom


;;
;; plugins to better use the emacs
;;

;; elpy mode auto enable for python
(elpy-enable)
(setq elpy-rpc-backend "jedi")
;; elpy test runner is pytest
'(elpy-test-runner (quote elpy-test-pytest-runner))
;; use ipython
;;(elpy-use-ipython)

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
;; bind enter to indent in yaml files
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; emmet mode! :)
(add-hook 'sgml-mode-hook 'emmet-mode);;auto start on any markup mode!
(setq emmet-move-cursor-between-quotes t) ;; cursor to first empty space!


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
