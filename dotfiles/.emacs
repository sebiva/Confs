;erlang mode
(setq load-path (cons  "/home/ezivase/opt/otp/OTP-20.3.2/x86_64-pc-linux-gnu/lib/erlang/lib/tools-2.11.2/emacs"
      load-path))
      (setq erlang-root-dir "$ERLTOP")
      (setq exec-path (cons "$ERLTOP" exec-path))
      (require 'erlang-start)

;;Remove menubar
(menu-bar-mode -1)

;;Move backup files
(setq backup-directory-alist `(("." . "~/.saves-emacs")))
;;Save more backups
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


;;jr mode
;;(load-file "$HOME/Dropbox/Documents/Dev/emacs/jr-mode.el")

;;File browser C-x d
;(load-file "$HOME/Documents/Dev/emacs/dired-detailsplus.el")
;(load-file "$HOME/Documents/Dev/emacs/dired-details.el")
;(require 'dired-details)
;(dired-details-install)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;;Start up screen
;;(find-file "~/Dropbox/Documents/Dev/emacs/emacs42")


;;Annat
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "color-198"))))
 '(font-lock-function-name-face ((t (:foreground "blue"))))
 '(font-lock-keyword-face ((t (:foreground "color-89"))))
 '(font-lock-string-face ((t (:foreground "color-54"))))
 '(mode-line ((t (:background "green" :foreground "black" :box (:line-width -1 :color "green" :style released-button)))))
 '(region ((t (:background "color-69")))))


;;Sätter fönstertiteln, %b = buffer, %f = filepath
(setq frame-title-format
  '("42 - "  "%b" "  ( " "%f"  " )" )
)

;;Markerar tillhörande parantes
(show-paren-mode 1)


;;Markerar all paranteser man är i
;(load-file "$HOME/Dropbox/Documents/Dev/emacs/highlight-parentheses.el")
;(require 'highlight-parentheses)
;(define-globalized-minor-mode global-highlight-parentheses-mode
  ;highlight-parentheses-mode
  ;(lambda ()
    ;(highlight-parentheses-mode t)))
;(global-highlight-parentheses-mode t)


;;Copy paste utanför emacs
(setq x-select-enable-clipboard t)

;;Radnummer på sidan
(global-linum-mode t)


;;Scrolling
 ;; scroll one line at a time (less "jumpy" than defaults)
    
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
    
    ;;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
    (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
    (setq scroll-step 1) ;; keyboard scroll one line at a time

;; If emacs is run in a terminal, the clipboard- functions have no
;; effect. Instead, we use of xsel, see
;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
;; program for getting and setting the contents of the X selection"
(unless window-system
 (when (getenv "DISPLAY")
  ;; Callback for when user cuts
  (defun xsel-cut-function (text &optional push)
    ;; Insert text to temp-buffer, and "send" content to xsel stdin
    (with-temp-buffer
      (insert text)
      ;; I prefer using the "clipboard" selection (the one the
      ;; typically is used by c-c/c-v) before the primary selection
      ;; (that uses mouse-select/middle-button-click)
      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
  ;; Call back for when user pastes
  (defun xsel-paste-function()
    ;; Find out what is current selection by xsel. If it is different
    ;; from the top of the kill-ring (car kill-ring), then return
    ;; it. Else, nil is returned, so whatever is in the top of the
    ;; kill-ring will be used.
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
      (unless (string= (car kill-ring) xsel-output)
	xsel-output )))
  ;; Attach callbacks to hooks
  (setq interprogram-cut-function 'xsel-cut-function)
  (setq interprogram-paste-function 'xsel-paste-function)
  ;; Idea from
  ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
  ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
 ))


;; 4 i tabavstånd

;;(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
;;(setq indent-line-function 'insert-tab)

;;(setq tab-stop-list (number-sequence 4 200 4))

(setq-default c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode nil)

;;Växla mellan x.cpp och x.h med C-c o
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))


;;Markera, skriva över markering
(cua-selection-mode t)



;; Auto complete (Funkar)
;(add-to-list 'load-path "~/.emacs.d/")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;(ac-config-default)


;;Auto complete 2

;;Pakethanterare
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)



;;(require 'auto-complete)
;;(require 'yasnippet)
;;(require 'irony) ;Note: hit `C-c C-b' to open build menu

;; the ac plugin will be activated in each buffer using irony-mode
;;(irony-enable 'ac)             ; hit C-RET to trigger completion

(defun my-c++-hooks ()
  "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
  ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
  ;; *may* persist after an expansion.
  (yas/minor-mode-on)
  (auto-complete-mode 1)

  ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
  (when (member major-mode irony-known-modes)
    (irony-mode 1)))

(add-hook 'c++-mode-hook 'my-c++-hooks)
(add-hook 'c-mode-hook 'my-c++-hooks)



;; COLOR

(set-face-background 'mode-line-inactive "#868686")

;; Latex pdf stuff

(setq TeX-PDF-mode t)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)


;; Haskell
;(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-mode.el")
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; EVIL

(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize)
  (require 'evil)
  (evil-mode 1)
