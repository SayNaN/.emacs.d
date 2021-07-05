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

(use-package which-key
  :defer nil
  :config
  ;;(setq which-key-popup-type 'minibuffer)
  (which-key-mode 1)
  )

(use-package counsel-gtags
   :after counsel
   :hook
   (c-mode . counsel-gtags-mode)
   (cc-mode . counsel-gtags-mode)
   (c++-mode . counsel-gtags-mode)
   :config
   (define-key counsel-gtags-mode-map (kbd "M-.") 'counsel-gtags-find-definition)
   (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
   (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
   (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward)
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

(use-package rainbow-delimiters
  :diminish
  :hook (prog-mode . rainbow-delimiters-mode))

;; Settings for jump windows, use M-NUM to switch
(use-package winum
  :init
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
  :config
  (setq winum-format "%s")
  (setq winum-mode-line-position 0)
  (setq winum-auto-assign-0-to-minibuffer t)
  (set-face-attribute 'winum-face nil :foreground "DeepPink" :underline "DeepPink" :weight 'bold)
  (winum-mode 1)
  )

(use-package keycast
  :commands keycast-mode)

(use-package realgud)
(use-package realgud-lldb
  :after realgud)

(provide 'init-package)
;;; init-package.el ends here
