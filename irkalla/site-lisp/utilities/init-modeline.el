;;; init-modeline.el --- An Emacs Modeline -*- lexical-binding: t -*-

;; Copyright (C) 2023-2023 Icy-Thought

;; Author: Icy-Thought <icy-thought@pm.me>
;; Keywords: internal
;; URL: https://icy-thought.github.io/

;;; Commentary:
;; A modeline to help us quickly monitor the cursor state & BG activity of our session.

;;; Code:

(use-package doom-modeline
  :hook (elpaca-after-init . doom-modeline-mode)
  :custom
  (doom-modeline-bar-width 4)
  (doom-modeline-buffer-file-name 'relative-to-project)
  (doom-modeline-github t)
  (doom-modeline-github-interval (* 30 60))
  (doom-modeline-height 35)
  (if (display-graphic-p) (doom-modeline-hud t)))

(use-package telephone-line
  :disabled t
  :hook ((prog-mode text-mode) . telephone-line-mode)
  :custom
  (telephone-line-height 26)
  (telephone-line-evil-use-short-tag t)
  ;; Left separator
  (telephone-line-primary-left-separator 'telephone-line-tan-left)
  (telephone-line-secondary-left-separator 'telephone-line-tan-hollow-left)
  ;; Right separator
  (telephone-line-primary-right-separator 'telephone-line-tan-right)
  (telephone-line-secondary-right-separator 'telephone-line-tan-hollow-right))

(provide 'init-modeline)
;;; init-modeline.el ends here
