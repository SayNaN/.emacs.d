;;; init-program.el --- Initialize Programming language with LSP mode

;;; Commentary:
;;; (c) Cabins, github.com/cabins/.emacs.d

;;; Code:

(require 'init-json)

;; Lispy keybinding tastes bad for me, so I disable it.
;; (require 'init-lisp)
(require 'init-python)
(require 'init-web)
(require 'init-yaml)

(require 'init-lsp)

(provide 'init-program)
;;; init-program.el ends here
