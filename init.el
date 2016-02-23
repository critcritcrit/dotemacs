;; package archive stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; company mode & bindings
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-\\")'company-complete)


;; lets emacs act properly in windows
;; also just general nice things like removing the toolbar
(require 'recentf)
(recentf-mode 1)
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

;; word wrapping
(global-visual-line-mode t)

;; turn on flycheck
(global-flycheck-mode 1)

;; starting emacs server
(server-start)

;; basic pairing (change to something better later on)
;; (electric-pair-mode 1)
(require 'smartparens-config)

;; c-x c-u/l to upcase/lowercase
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; tab completion with indenting
(setq tab-always-indent 'complete)

;; shows column number
(setq column-number-mode t)

;; theme stuff
(require 'moe-theme)
(moe-dark)

;; for when i accidently reopen a buffer multiple times
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(global-set-key (kbd "M-/") 'hippie-expand)


;; typing of the dead
(autoload 'typing-of-emacs "The Typing Of Emacs, a game." t)

;; helm stuff
(require 'helm-config)
(helm-mode 1)

;; windows specific settings
(when (eq system-type 'windows-nt)
(setq-default ispell-program-name "C:/Program Files (x86)/aspell/bin/aspell.exe")
(setq flycheck-c/c++-cppcheck-executable "C:/Program Files/Cppcheck/cppcheck.exe"))


;; Various org-mode options
(if (eq system-type 'windows-nt)
    (setq org-agenda-files (quote ("C:/Users/Jc/Dropbox/notes")))
  (setq org-agenda-files (quote ("~/Dropbox/notes"))))
(add-hook 'org-mode-hook '(lambda() (flyspell-mode t) ))

(global-set-key (kbd "C->") 'org-demote-subtree)
(global-set-key (kbd "C-<") 'org-promote-subtree)
(global-set-key (kbd"C-|") 'org-agenda)


;; guru mode to train not using arrow keys
(guru-global-mode +1)

;; God-mode setitngs
(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode-all)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)
;; .emacs ends here



