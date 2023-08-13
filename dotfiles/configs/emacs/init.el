;; GENERAL
;;-----------------------------
(setq inhibit-startup-message t)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Startup frame size
(add-hook 'after-init-hook '(lambda () (w32-send-sys-command #xf030)))

;; Dired
;; Show hidden and system folder/files
;; (setq ls-lisp-dirs-first t)
;; (setq ls-lisp-ignore-case t)
;; (setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-use-localized-time-format t)
(setq ls-lisp-format-time-list '("%Y-%m-%d %H:%M" "%Y-%m-%d "))
;; (if (eq system-type 'windows-nt)
;;       (setq ls-lisp-verbosity nil)
;;       (setq ls-lisp-verbosity '(links uid gid)))
;; (setq dired-listing-switches "-lah --group-directories-first --time-style \"+%m-%d-%Y %H:%M:%S\"")

;; Make dired open in the same window when using RET
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; Line numbers
(global-display-line-numbers-mode)
;(setq display-line-numbers 'relative)

;; Ruler column at 80 chars
(add-hook 'after-change-major-mode-hook #'display-fill-column-indicator-mode)
(setq-default display-fill-column-indicator-column 88)

;; Set up the visible bell
;; (setq visible-bell t)

;; Panels
(scroll-bar-mode -1)   ; Disable visible scrollbar
(tool-bar-mode -1)     ; Disable the toolbar
(tooltip-mode -1)      ; Disable tooptips
(menu-bar-mode -1)     ; Disable the menu bar
(blink-cursor-mode -1) ; Disable cursor blink
(set-fringe-mode -1)   ; Give some breathing room

;; Backups
; (setq make-backup-files nil)


;; Org Mode
(setq org-clock-sound "~/.emacs.d/bell-2.mp3")

;; VISUAL
;;-----------------------------
;; Set theme
(load-theme 'uaihu t)

;; Set the font
(set-face-attribute 'default nil :font "Iosevka SS02 Medium" :height 140)

;; Mode line


;; KEYBINDINGS
;;-----------------------------
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x e") 'eval-buffer)
(global-set-key (kbd "C-x r") 'redo) ;; FIXME
(global-set-key (kbd "C-x c") 'eshell)
(global-set-key (kbd "C-x C-v") 'find-file)
(global-set-key [f6] 'browse-file-directory)
(if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
  nil)

;; Buffers
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; Text Operations
;;(global-set-key (kbd "C-M-up") 'move-text-up)
;;(global-set-key (kbd "C-M-down") 'move-text-down)
(global-set-key (kbd "C-g") 'select-whole-line)
(global-set-key (kbd "C-x g") 'select-whole-block)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region-or-line)
;; TODO: Uppercase
;; TODO: Lowercase

;; CUA Mode
;; Allows you to use C-c, C-v, C-x, and C-z as you would in other programs.
(cua-mode 1)

;; Recentf backup files
(savehist-mode 1)
(recentf-mode 1)
(setq recentf-max-menu-items 100)
(setq recentf-max-saved-items 100)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; Disable
(global-set-key (kbd "C-x C-c") nil)


;; FUNCTIONS
;;-----------------------------
(defun browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg)
          (when (and (eval-when-compile
		       '(and (>= emacs-major-version 24)
                             (>= emacs-minor-version 3)))
                     (< arg 0))
            (forward-line -1)))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(defun select-whole-line ()
  "Select current line. If region is active, extend selection downward by line."
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
        (end-of-line))
    (progn
      (end-of-line)
      (set-mark (line-beginning-position)))))

(defun select-whole-block ()
  "Select the current/next block of text between blank lines."
  (interactive)
  (if (region-active-p)
      (re-search-forward "\n[ \t]*\n" nil "move")
    (progn
      (skip-chars-forward " \n\t")
      (when (re-search-backward "\n[ \t]*\n" nil "move")
        (re-search-forward "\n[ \t]*\n"))
      (push-mark (point) t t)
      (re-search-forward "\n[ \t]*\n" nil "move"))))


;; PACKAGES
;;-----------------------------
;; Initialize package sources
(require 'org)
(require 'package)
(require 'use-package)

(setq use-package-always-ensure t)
(setq package-archives '(
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;; PACKAGES CONFIGURATIONS
;;-----------------------------
;; Custom packages configurations
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("60b47e6498813840d680a75dd66b622955851d64f4da1c4ab76b337946ee89ec" default))
 '(package-selected-packages
   '(image-dired+ dired-x php-mode twig-mode tt counsel smex prodigy typescript-mode lsp-mode swiper swiper magit vterm powershell expand-region diminish swiper ivy uaihu use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; No-littering
; Keep .emacs.d clean
(use-package no-littering
  :ensure t
  :config
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)
  (setq backup-directory-alist
	`((".*" . ,(no-littering-expand-var-file-name "backup/"))))
  (setq auto-save-file-name-transforms
	`((".*", (no-littering-expand-var-file-name "auto-save/") t)))
)

;; Diminish
(use-package diminish
  :ensure t)

;; Dired-X
;; (use-package image-dired+
;;   :ensure t)
;; (setq dired-omit-files
;;       (concat dired-omit-files
;; 	      "\\|^.DS_STORE$
;;               \\|^desktop.ini$
;;               \\|^icon.ico$"))

;; Ivy
(use-package ivy
  :diminish
  :bind
  (("C-x f" . swiper)
   :map ivy-minibuffer-map
   ("TAB" . ivy-alt-done)
   ("C-l" . ivy-alt-done)
   ("C-k" . ivy-previous-line)
   :map ivy-switch-buffer-map
   ("C-k" . ivy-previous-line)
   ("C-l" . ivy-done)
   ("C-d" . ivy-switch-buffer-kill)
   :map ivy-reverse-i-search-map
   ("C-k" . ivy-previous-line)
   ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(setq ivy-initial-inputs-alist nil)

;; Swiper
(use-package swiper
  :ensure t)

;; Counsel
(use-package counsel
  :ensure t)

;; Smex
(use-package smex
  :ensure t)
(global-set-key (kbd "M-x") 'counsel-M-x)

;; Magit
(use-package magit
  :ensure t
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-windows-except-diff-v1))

;; Projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode)
  (setq projectile-project-root-functions '(projectile-root-local
                                            projectile-root-top-down
                                            projectile-root-top-down-recurring
                                            projectile-root-bottom-up))
  :bind
  (("C-x p"   . 'projectile-command-map)
   ("C-x C-b" . 'projectile-switch-to-buffer))
  :init
  (when (file-directory-p "d:/Repo/")
    (setq projectile-project-search-path '("d:/Repo/")))
  (setq projectile-switch-project-action #'projectile-dired))

;; Prodigy
(use-package prodigy
  :ensure t)

;; Expand Region
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region))

;; Move Text
(use-package move-text
  :ensure t)

;; Evil mode

;; Powershell
;; (use-package powershell
;;   :ensure t)
;; (setq explicit-shell-file-name "c:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe")
;; (setq explicit-powershell.exe-args '("–noprofile"))


;; PROGRAMMING
;;-----------------------------
;; Language Server Protocol
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l"))
  ;; :config
  ;; (lsp-enable-which-key-integration t))

;; Typescript
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

;; Twig
(use-package twig-mode
  :ensure t)

;; PHP
(use-package php-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.inc$"     . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$"  . php-mode))
(add-to-list 'auto-mode-alist '("\\.php$"     . php-mode))
(add-to-list 'auto-mode-alist '("\\.profile$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.theme$"   . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php$" . php-mode))

