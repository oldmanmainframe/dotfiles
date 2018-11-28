;; ---------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; install evil from above . . .
(require 'evil)
;;(evil-mode 1)
(global-linum-mode t)
(setq linum-format "%4d ")

;; install undo-tree
;; undo tree mode setup
(global-undo-tree-mode)
(setq undo-tree-visualizer-diff t)
(setq undo-tree-visualizer-timestamps t)
(global-set-key (kbd "<f12>") 'undo-tree-visualize)

;; install sr-speedbar
;; sr-speedbar setup
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-auto-refresh t)
(setq speedbar-directory-unshown-regexp
	  "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")
(add-hook 'speedbar-before-visiting-file-hook 'sr-speedbar-close t)
(global-set-key (kbd "C-o") 'sr-speedbar-toggle)

;;
;; setup local load path for local packages
;;
(let ((default-directory "~/.emacs.d/lisp/"))
    (normal-top-level-add-subdirs-to-load-path))
;;
;; setup for frames package
;;
;;(setq pop-up-frames t)
;;(setq ns-pop-up-frames t)
;;(require 'frame-bufs)
(defun empty-frame()
    "Open a new frame with a buffer named Untitled<N>.

    The buffer is not associated with a file."
      (interactive)
        (switch-to-buffer-other-frame (generate-new-buffer "Untitled")))
;; tips on effective emacs usage
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;
;; turn off the blinky
;;
(setq blink-cursor-mode nil)
;; ---------------------------------------------------------------------------
;; display time in the modeline
;; ---------------------------------------------------------------------------
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; ---------------------------------------------------------------------------
;; let the mouse wheel scroll
;; ---------------------------------------------------------------------------
(mouse-wheel-mode t)

;; ---------------------------------------------------------------------------
;; hi-lite current line
;; ---------------------------------------------------------------------------
;;(global-hl-line-mode 1)

;; ---------------------------------------------------------------------------
;; ensure paren matching is on
;; ---------------------------------------------------------------------------
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; ---------------------------------------------------------------------------
;; make searches case-INsensitive
;; ---------------------------------------------------------------------------
(set-default 'case-fold-search t)

;; ---------------------------------------------------------------------------
;; This makes `apropos' and `super-apropos'
;; do everything that they can and run slower.
;; ---------------------------------------------------------------------------
(setq apropos-do-all t)

;; ---------------------------------------------------------------------------
;; Stop ^M's from displaying in system shell window
;; ---------------------------------------------------------------------------
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;; ---------------------------------------------------------------------------
;; This tells emacs to show the column number in each modeline.
;; ---------------------------------------------------------------------------
(setq column-number-mode 1)

;; ---------------------------------------------------------------------------
;; Setting the defualt tabulation
;; ---------------------------------------------------------------------------
(setq default-tab-width 4)
;; no more tab characters!!
;; okay, SOME files (makefiles, Blackboard test files) REALLY need tabs
;; so I can't use the following . . .
;; but remember . . . the "untabify" command.
;;(setq-default indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; ---------------------------------------------------------------------------
;; Wrap lines while typing in text mode
;; ---------------------------------------------------------------------------
;;(setq fill-column 80)
;;(add-hook 'text-mode-hook 'auto-fill-mode t)
;;(setq hscroll-global-mode t)

;; ---------------------------------------------------------------------------
;; Remove the startup message
;; ---------------------------------------------------------------------------
(setq inhibit-startup-message t)

;; ---------------------------------------------------------------------------
; don't automatically add new lines when
;;scrolling down at the bottom of a buffer
;; ---------------------------------------------------------------------------
(setq next-line-add-newlines nil)

;; ---------------------------------------------------------------------------
;;delete excess backup versions
;; ---------------------------------------------------------------------------
(setq delete-old-versions t)

;; ---------------------------------------------------------------------------
;; Do not make backup files
;; ---------------------------------------------------------------------------
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;; ---------------------------------------------------------------------------
;; Do only one line scrolling.
;; ---------------------------------------------------------------------------
(setq scroll-step 1)

;; ---------------------------------------------------------------------------
;; Start scrolling when 2 lines from top/bottom
;; ---------------------------------------------------------------------------
;;(setq scroll-margin 1)

;; ---------------------------------------------------------------------------
;; Shut off message buffer.
;; ---------------------------------------------------------------------------
;; (setq message-log-max nil)
;; (kill-buffer "*Messages*")

;; ---------------------------------------------------------------------------
;; Save session in ~/.emacs.desktop
;; ---------------------------------------------------------------------------
(load "desktop")
(desktop-load-default)
(desktop-read)

;; ---------------------------------------------------------------------------
;; Make all "yes or no" prompts show "y or n" instead
;; ---------------------------------------------------------------------------
(fset 'yes-or-no-p 'y-or-n-p)

;; ---------------------------------------------------------------------------
;; set autocompletion on
;; ---------------------------------------------------------------------------
(dynamic-completion-mode) ;;!!! slows startup !!!

;; ---------------------------------------------------------------------------
;; We want compression support, entering tgz files etc.. :)
;; ---------------------------------------------------------------------------
;;(auto-compression-mode t) ;; !!! slows startup !!!


;; ---------------------------------------------------------------------------
;; This turns off the GUI menus in X.
;; ---------------------------------------------------------------------------
;;(menu-bar-mode nil)
  (tool-bar-mode nil)

;; ---------------------------------------------------------------------------
;; Some elisp customization
;; ---------------------------------------------------------------------------
;;(setq debug-on-error t)
;;(setq debug-on-quit t)

;; ----------------------------------------------------------------------------
;;;;;;;;;;; Frame title bar formatting to show full path of file ;;;;;;;;;;;;;;
;; ----------------------------------------------------------------------------
(setq-default
 frame-title-format
 (list
  '((buffer-file-name
     " %f"
     (dired-directory
      dired-directory
      (revert-buffer-function
       " %b"
       ("%b - Dir:  " default-directory)))))))

(setq-default
 icon-title-format
 (list
  '((buffer-file-name
     " %f"
     (dired-directory
      dired-directory
      (revert-buffer-function
       " %b"
       ("%b - Dir:  " default-directory)))))))

(setq frame-title-format "%f - Emacs")
(setq icon-title-format  "%f - Emacs")

(setq message-log-max nil)
(kill-buffer "*Messages*")

(setq display-time-24hr-format t)

(defun new-line-below (num-lines)
   "Add new line below current line"
   (interactive "p")
   (end-of-line ())
   (newline()))

(substitute-key-definition
   'open-line 'new-line-below (current-global-map))

(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [\C-home] 'beginning-of-buffer)
(global-set-key [\C-end] 'end-of-buffer)

(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;;(setq auto-mode-alist
;;(append (list '("\\.cc$"    .c++-mode)
;;             '("\\.hh$"    .c++-mode)
;;              '("\\.hpp$"   .c++-mode)
;;              '("\\.c$"     .c++-mode)
;;              '("\\.h$"     .c++-mode)
;;              '("\\.html$"  .html-helper-mode)
;;              '("\\.htm$"   .html-helper-mode))
;;          auto-mode-alist))

(setq win32-pass-alt-to-system t)
(setq default-frame-alist
      (append default-frame-alist
              '((width . 85)
                (height . 35)
                )
              ))

(setq win32-pass-alt-to-system t)
(global-set-key [f5] 'replace-string)
(global-set-key [f6] 'goto-line)
(autoload 'follow-mode "follow"
    "Synchronize windows showing the same buffer, minor mode." t)

;; ---------------------------------------------------------------------------
;; Turn on font-lock in all modes that support it
;; ---------------------------------------------------------------------------
(if (fboundp 'global-font-lock-mode)
     (global-font-lock-mode t))

;; Maximum colors
(setq font-lock-maximum-decoration t)

;;(global-font-lock-mode nil)

;; ---------------------------------------------------------------------------
;; Don't wrap long lines.
;; ---------------------------------------------------------------------------
(set-default 'truncate-lines t)
(global-visual-line-mode)

;; ---------------------------------------------------------------------------
; Set C code mode to Kernighan and Ritchie mode - book p.326
;; ---------------------------------------------------------------------------
(add-hook 'c-mode-hook (lambda ()
   (c-set-style "K&R"
    setq c-basic-offset 4
    tab-width 4)))

; do for java as well . . .
(setq c-default-style
	'((java-mode ."java") (other . "k&r")))

(add-hook 'java-mode-hook (lambda ()
   (setq c-basic-offset 4
         tab-width 4)))

;; ---------------------------------------------------------------------------
;; set my default font . . .
;; ---------------------------------------------------------------------------
;;(set-default-font "IBM Plex Mono Text 11")
;;set-default-font "IBM 3270 14")
(set-face-attribute 'default nil :font  "IBM 3270 12")
;;(set-default-font "Terminus-12")
;;(set-default-font "Fixed-11")
;;(set-default-font "Verily Serif Mono-10")
;;(set-default-font "Bitstream Vera Sans Mono-11")
;;(set-default-font "Monaco-11")
;;(set-default-font "Ubuntu Mono-12")
;;(set-default-font "Terminus-13")

;;"-outline-Consolas-normal-r-normal-normal-9-*-*-*-c-*-*-1")

;; ---------------------------------------------------------------------------
;; Give me insanely great and efficient buffer switching.
;; ---------------------------------------------------------------------------
;;(with-feature
;; iswitchb)
(setq iswitchb-mode t)

;; ---------------------------------------------------------------------------
;; Key Bindings
;; ---------------------------------------------------------------------------
;; These map to ISPF . . .
;;(global-set-key [f2]         'split-window-vertically)
(global-set-key [f2]         'split-window-vertically)
(global-set-key [f3]         'kill-buffer-and-window)
(global-set-key [f5]         'isearch-forward)
(global-set-key [(shift f5)] 'isearch-backward)
(global-set-key [f6]         'replace-regexp)
(global-set-key [f7]         'scroll-down)
(global-set-key [f8]         'scroll-up)
(global-set-key [f9]	     	  'next-buffer)
(global-set-key [f11]        'other-window)
;;(global-set-key [f12]        'other-window)

(global-set-key "\M-g" 'goto-line)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)

;; ---------------------------------------------------------------------------
;;;; slime setup
;; ---------------------------------------------------------------------------
;;(setq inferior-lisp-program "/usr/bin/clisp") ; your Lisp system
;;(add-to-list 'load-path "/usr/local/share/emacs/slime-2010-07-15/")  ; your SLIME directory
;;(require 'slime)
;;(slime-setup)
;; ---------------------------------------------------------------------------
;;;; set default colors
;; ---------------------------------------------------------------------------
(if (display-graphic-p)
	(progn
	  (set-background-color "#000000")
		(set-face-background 'default "#000000")
		(set-face-background 'region "#55ff55")
		(set-face-foreground 'default "#55ff55")
		(set-face-foreground 'region "#000000")
		(set-face-attribute 'mode-line nil
			:foreground "#ff0000"
			:background "#0000ff")
		(set-foreground-color "#55ff55")
        (set-face-attribute 'mode-line nil
            :foreground "#ffffff"
            :background "black"
            :box '(:line-width 2 :color "#55ffff"))
        (set-face-attribute 'modeline-inactive nil
            :foreground "#aaaaaa" :background "black"
            :box "#00aa00"))
		;; else
	(progn
		(set-background-color "black")
		(set-face-background 'default "black")
		(set-face-background 'region "white")
		(set-face-foreground 'default "green")
		(set-face-foreground 'region "green")
		(set-foreground-color "black")
        (set-face-attribute 'mode-line nil
            :foreground "black"
            :background "cyan")
        (set-face-attribute 'modeline-inactive nil
            :foreground "gray"
            :background "cyan")))

(set-face-foreground 'header-line "yellow")
(set-face-background 'menu "yellow")
(set-face-foreground 'menu "black")
(set-face-foreground 'border "yellow")
(set-face-background 'fringe "#00aaaa")
(fringe-mode 4)
(set-face-foreground 'minibuffer-prompt  "cyan")
;; end add color to different elements . .
(set-cursor-color "white")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes (quote ("de1f10725856538a8c373b3a314d41b450b8eba21d653c4a4498d52bb801ecd2" "5ed25f51c2ed06fc63ada02d3af8ed860d62707e96efc826f4a88fd511f45a1d" default)))
 '(display-time-mode t)
 '(inhibit-local-menu-bar-menus t)
 '(safe-local-variable-values (quote ((eval when (require (quote rainbow-mode) nil t) (rainbow-mode 1)))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-button ((((type x w32 ns) (class color)) (:background "lightgrey" :foreground "black" :box (:line-width 2 :style released-button) :height 0.5))))
 '(custom-comment-tag ((t (:foreground "#55ffff"))))
 '(font-lock-builtin-face ((t (:foreground "#55ff55"))))
 '(font-lock-comment-face ((t (:foreground "#55ffff"))))
 '(font-lock-constant-face ((t (:foreground "#55ff55"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "#55ff55"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background light dark)) (:foreground "#ffffff" :slant italic :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "#55ff55" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "#55ff55"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background light)) (:foreground "#55ff55" :weight bold))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background light)) (:foreground "#55ff55"))))
 '(menu ((((type x-toolkit)) (:height 0.75 :width normal))))
 '(speedbar-button-face ((((class color) (background light)) (:foreground "green4" :height 1.0)))))
;;--(require 'oneonone)
;;--(setq default-frame-alist  nil)
;;--(setq initial-frame-alist  '((background-color . "White"))); e.g.
;;--(remove-hook 'same-window-regexps "\\*info\\*\\(\\|<[0-9]+>\\)")
;;--(remove-hook 'same-window-regexps "\\`\\*Customiz.*\\*\\'")
;;--(define-key minibuffer-local-map "\C-o"
;;--    '1on1-fit-minibuffer-frame)
;;--(define-key minibuffer-local-must-match-map "\C-o"
;;--    '1on1-fit-minibuffer-frame)
;;--(define-key minibuffer-local-completion-map "\C-o"
;;--    '1on1-fit-minibuffer-frame)
;;--(1on1-emacs)
