;;; init.el -*- lexical-binding: t; -*-

;; GC pauses -> faster (decrease threshold)
(setq gc-cons-threshold (* 2 1000 1000))

;; Initialize --debug-init on error
(setq debug-on-error init-file-debug)

;;; Load `lisp` & `plugins` direcotries into path
(add-to-list 'load-path "~/.config/emacs/lisp")

(add-to-list 'load-path "~/.config/emacs/plugins/completion")
(add-to-list 'load-path "~/.config/emacs/plugins/editor")
(add-to-list 'load-path "~/.config/emacs/plugins/langserv")
(add-to-list 'load-path "~/.config/emacs/plugins/toolset")
(add-to-list 'load-path "~/.config/emacs/plugins/ui")

;;; Use-Packages: ease of package management
(require 'init-melpa)

;; Data-related files belongs in `$XDG_DATA_HOME`...
(setq user-emacs-directory "~/.local/share/emacs/")

;; Directories: default -> designated ~/.config/emacs/directory..
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups/"))))
(setq auto-save-file-name-transforms
      `(("." . ,(concat user-emacs-directory "auto-save/session"))))
(setq lock-file-name-transforms
      `(("." . ,(concat user-emacs-directory "auto-save/lock"))))

;; Customization -> /tmp/emacs-custom-*.el
(setq custom-file
      (if (boundp 'server-socket-dir)
        (expand-file-name "custom.el" server-socket-dir)
        (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))
(load custom-file t)

;;; (no-littering) A cleaner Emacs directory
(use-package no-littering
    :init
    (setq no-littering-etc-directory ,(concat user-emacs-directory "etc")
          no-littering-var-directory ,(concat user-emacs-directory "var")))

;; (Testing) lisp/module.el
(require 'init-decorations)
(require 'init-options)
(require 'init-shortcuts)

;; (Testing) plugins/module.el
(require 'init-completion)
(require 'init-langserv)
(require 'init-editor)
(require 'init-toolset)
(require 'init-ui)
