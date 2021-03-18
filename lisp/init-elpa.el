;;; init-elpa --- initialize elpa repository

;;; Commentary:
;;; (c)Cabins, github.com/cabins/.emacs.d

;;; Code:

;;; Settings for package archives
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq package-check-signature nil)

 ;; cl - Common Lisp Extension
(require 'cl)

(require 'package)

;; cl - Common Lisp Extension
(require 'cl)

;;; Initialize the packages, avoiding a re-initialization
(unless (bound-and-true-p package--initialized) ;; To avoid warnings on 27
  ;; (when (version< emacs-version "27.0")
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

 ;; Add Packages
(defvar my/packages '(
                      use-package
                      spacemacs-theme
                      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Configure use-package prior to loading it
(eval-and-compile
  (setq use-package-always-ensure t
        ;;use-package-always-defer t
        use-package-always-demand nil
        use-package-expand-minimally t
        use-package-verbose t))
(setq load-prefer-newer t)

(eval-when-compile
  (require 'use-package))

(provide 'init-elpa)
;;; init-elpa.el ends here
