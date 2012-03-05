;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
(setq require-final-newline 'query)

;; python-mode
(add-hook 'python-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)))

;; scheme-mode (gauche)
(setq scheme-program-name "/usr/local/bin/gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cS" 'scheme-other-window)

;; highlights ()
(show-paren-mode)

;; not backup
(setq make-backup-files nil)

;; Japanese
(prefer-coding-system 'utf-8-unix)
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)

;; Fonts
(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
(setq face-font-rescale-alist '((".*Hiragino.*" . 1.0) (".*Menlo.*" . 1.0)))

;; window size
(setq initial-frame-alist
      (append
       '((width . 210)    ; フレーム幅(文字数)
	 (height . 70)   ; フレーム高(文字数)
	 ) initial-frame-alist))

;; highlight current line
(defface my-hl-line-face
  '((((class color)
      (background dark))
     (:background "#222244"))
    (((class color)
      (background light))
     (:background "LightSteelBlue1"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; display linenum
(line-number-mode t)
(column-number-mode t)

;; system settings
(setq gc-cons-threshold (* 10 gc-cons-threshold))
(setq message-log-max 10000)
(setq history-length 1000)
(setq echo-keystrokes 0.1)

;; load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/auto-install/")

;; color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; anything.el
(require 'anything-startup)
(global-set-key (kbd "C-;") 'anything-filelist+)
(setq anything-c-filelist-file-name "/tmp/all.filelist")

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(setq auto-install-use-wget nil)
;; (setq auto-install-wget-command "/usr/bin/wget")
;; (auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; php-mode
(load-library "php-mode") 
(require 'php-mode)

