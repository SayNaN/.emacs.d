;;; init.el --- Initialization file

;;; Commentary:
;;  This is NOT part of GNU Emacs.  It's a personal project of Emacs configuration.
;;  Written by (c) Cabins Kong.  2019-2020.

;;; Code:
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/")))

(require 'init-consts)
(require 'init-elpa)
(require 'init-mySetting)
(require 'interactive-funcs)
(require 'init-package)
(require 'init-org)
(require 'init-kbd)
(require 'init-misc)
(require 'init-program)
(require 'init-ui)

;;; init.el ends here
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
