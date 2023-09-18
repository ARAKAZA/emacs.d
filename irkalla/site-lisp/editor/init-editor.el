;;; init-editor.el --- Editor-related Configurations -*- lexical-binding: t -*-

;; Copyright (C) 2023-2023 Icy-Thought

;; Author: Icy-Thought <icy-thought@pm.me>
;; Keywords: internal
;; URL: https://icy-thought.github.io/

;;; Commentary:
;; A place for us to retain short and built-in editor-related Emacs customizations.

;;; Code:

(irkalla/enable-modules
 (evil dirvish ligatures memorandum ediff olivetti region citar treesitter whitespace))

(use-package emacs
  :elpaca nil
  :hook (text-mode . (lambda ()
                       (auto-fill-mode)
                       (visual-line-mode)
                       (setq-local bidi-paragraph-direction nil)))
  :custom 
  (confirm-nonexistent-file-or-buffer nil)
  (electric-indent-inhibit t)
  (fill-column 120)
  (find-file-suppress-same-file-warnings t)
  (indent-tabs-mode nil)
  (remote-file-name-inhibit-locks t)
  (standard-indent 4)
  (tab-width 4)
  (truncate-lines t)
  (truncate-string-ellipsis "↴")
  (window-combination-resize t)
  (word-wrap nil)
  (x-stretch-cursor t))

(use-package auto-revert
  :elpaca nil
  :hook ((prog-mode text-mode) . auto-revert-mode)
  :custom
  (auto-revert-interval 1)
  (auto-revert-notify t)
  (auto-revert-verbose t))

(use-package editorconfig
  :hook (prog-mode . editorconfig-mode))
 
(use-package display-line-numbers
 :elpaca nil
 :hook ((prog-mode text-mode conf-mode) . display-line-numbers-mode)
 :custom (display-line-numbers-type 'relative))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package elec-pair
  :elpaca nil
  :hook ((prog-mode text-mode) . electric-pair-mode)
  :custom (electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))

(use-package hl-line
  :elpaca nil
  :hook (elpaca-after-init . global-hl-line-mode))

(provide 'init-editor)
;;; init-editor.el ends here
