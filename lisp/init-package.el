;;; init-package --- initialize the plugins

;;; Commentary:
;;; (c)Cabins, github.com/cabins/.emacs.d

;;; Code:

;; Hungry Delete - delete multi spaces with one <delete> key
(use-package hungry-delete
  :config (global-hungry-delete-mode))

;; Setting for ivy & counsel & swiper
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :config (progn
            (global-set-key "\C-s" 'swiper)
            (global-set-key (kbd "C-c C-r") 'ivy-resume)
            (global-set-key (kbd "<f6>") 'ivy-resume)
            (global-set-key (kbd "C-x C-f") 'counsel-find-file)
            (global-set-key (kbd "C-h f") 'counsel-describe-function)
            (global-set-key (kbd "C-h v") 'counsel-describe-variable)
            ;;(global-set-key (kbd "C-h o") 'counsel-describe-symbol)
            ;;(global-set-key (kbd "C-h l") 'counsel-find-library)
            ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
            ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
            (global-set-key (kbd "C-c g") 'counsel-git)
            (global-set-key (kbd "C-c f") 'counsel-git-grep)
            (global-set-key (kbd "C-c r") 'counsel-rg)
            (global-set-key (kbd "C-c l") 'counsel-locate)
            (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
            (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))

(use-package counsel
  :after ivy
  :bind (("M-x" . counsel-M-x)))

(use-package counsel-gtags
  :after counsel
  :config
  (counsel-gtags-mode 1)
  :bind
  ("M-t" . counsel-gtags-find-definition)
  ("M-r" . counsel-gtags-find-reference)
  ("M-s" . counsel-gtags-find-symbol)
  ("M-," . counsel-gtags-go-backward)
  )

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))

;; Enable flymake on default, which is built in emacs
(use-package flymake
  :ensure nil
  :diminish (flymake " Flym.")
  :hook (prog-mode . flymake-mode)
  :bind (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(use-package auto-highlight-symbol
  :hook (prog-mode . auto-highlight-symbol-mode))

;; Settings for highlight parentheses
(use-package highlight-parentheses
  :diminish
  :hook (prog-mode . highlight-parentheses-mode))

(use-package rainbow-delimiters
  :diminish
  :hook (prog-mode . rainbow-delimiters-mode))

;; Settings for jump windows, use M-NUM to switch
(use-package winum
  :init
  ;; {{ move focus between sub-windows
  (setq winum-keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
          (define-key map (kbd "M-1") 'winum-select-window-1)
          (define-key map (kbd "M-2") 'winum-select-window-2)
          (define-key map (kbd "M-3") 'winum-select-window-3)
          (define-key map (kbd "M-4") 'winum-select-window-4)
          (define-key map (kbd "M-5") 'winum-select-window-5)
          (define-key map (kbd "M-6") 'winum-select-window-6)
          (define-key map (kbd "M-7") 'winum-select-window-7)
          (define-key map (kbd "M-8") 'winum-select-window-8)
          map))
  (winum-mode)
  :config
  (setq winum-format "%s")
  (setq winum-mode-line-position 0)
  (set-face-attribute 'winum-face nil :foreground "DeepPink" :underline "DeepPink" :weight 'bold)
  )

;; Restart emacs
;; Use custom interactive func "cabins/reload-init-file" instead.
;; (use-package restart-emacs)

;; Beacon mode - highlight the line where your cursor is
(use-package beacon
  :unless *is-windows*
  :hook (after-init . beacon-mode))

(use-package keycast
  :commands keycast-mode)

;; Indent grade guide line
(use-package indent-guide
  :hook (after-init-hook . indent-guide-global-mode))

(use-package paren
  :config (show-paren-mode 1))

;; (use-package w3m
;;   :config
;;   ;; 默认显示图片
;;   (setq w3m-default-display-inline-images t)
;;   (setq w3m-default-toggle-inline-images t)
;;   ;;显示图标
;;   (setq w3m-show-graphic-icons-in-header-line t)
;;   (setq w3m-show-graphic-icons-in-mode-line t)
;;   (setq w3m-use-cookies t))

(provide 'init-package)
;;; init-package.el ends here
