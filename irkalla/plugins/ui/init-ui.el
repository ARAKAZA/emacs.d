;;; init-ui.el -*- lexical-binding: t -*-

;; Require custom ui modules:
(require 'init-centaur-tabs)
(require 'init-dashboard)
(require 'init-doom-modeline)
(require 'init-doom-themes)
(require 'init-indentation)

;; Decorating with icons
(use-package all-the-icons
  :if (display-graphic-p))

(provide 'init-ui)