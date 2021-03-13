;;; init-package --- initialize the plugins

;;; Commentary:
;;; (c)Cabins, github.com/cabins/.emacs.d

;;; Code:

;; ******************** benchmark (Optional) ********************
;; Settings for benchmark package
;; (use-package benchmark-init
;;   :init (benchmark-init/activate)
;;   :hook (after-init . benchmark-init/deactivate))


;; Settings for exec-path-from-shell
(use-package exec-path-from-shell
  :defer nil
  :if (memq window-system '(mac ns x))
  :init (exec-path-from-shell-initialize))

;; Settings for C-a behavior
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c ^" . crux-top-join-line)
         ("C-," . crux-find-user-init-file)
         ("C-S-d" . crux-duplicate-current-line-or-region)
         ("C-S-k" . crux-smart-kill-line))) ; We can use C-S-<Backspace> instead.

;; Hungry Delete - delete multi spaces with one <delete> key
(use-package hungry-delete
  :config (global-hungry-delete-mode))

;; drag-stuff - move lines up/down
(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

;; Settings for company
(use-package company
  :diminish (company-mode " Com.")
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config (setq company-dabbrev-code-everywhere t
                company-dabbrev-code-modes t
                company-dabbrev-code-other-buffers 'all
                company-dabbrev-downcase nil
                company-dabbrev-ignore-case t
                company-dabbrev-other-buffers 'all
                company-require-match nil
                company-minimum-prefix-length 1
                company-show-numbers t
                company-tooltip-limit 20
                company-idle-delay 0
                company-echo-delay 0
                company-tooltip-offset-display 'scrollbar
                company-begin-commands '(self-insert-command)))

;; Better sorting and filterin
(use-package company-prescient
  :init (company-prescient-mode 1))

;; Setting for ivy & counsel & swiper
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :config (progn
            (global-set-key "\C-s" 'swiper)
            (global-set-key (kbd "C-c C-r") 'ivy-resume)
            (global-set-key (kbd "<f6>") 'ivy-resume)
            (global-set-key (kbd "M-x") 'counsel-M-x)
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

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))

;; Settings for which-key - suggest next key
(use-package which-key
  :defer nil
  :config (which-key-mode))

;; Settings for magit
;; I quit using magit on windows, 'cause its performance sucks
;; I use emacs builtin vc & cli-git on windows instead
(use-package magit
  :unless *is-windows*
  :bind ("C-x g" . magit-status))

;; Settings for yasnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :init (yas-global-mode)
  :config
  (add-to-list 'yas-snippet-dirs (concat
                                  (file-name-directory user-emacs-directory)
                                  "snippets"))
  (use-package yasnippet-snippets
    :after yasnippet)

  (use-package auto-yasnippet
    :bind (("C-o" . aya-open-line)
           ("H-w" . aya-create)
           ("H-y" . aya-expand))))

;; Settings for projectile
;; Using after-init hook makes emacs starts up faster than config projectile-mode
(use-package projectile
  :unless *is-windows*
  :diminish (projectile-mode " Proj.")
  :hook (after-init . projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

;; Enable flymake on default, which is built in emacs
(use-package flymake
  :ensure nil
  :diminish (flymake " Flym.")
  :hook (prog-mode . flymake-mode)
  :bind (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

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

;; Restart emacs
;; Use custom interactive func "cabins/reload-init-file" instead.
;; (use-package restart-emacs)

;; auto update packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-version t
        auto-package-update-hide-results t)
  (auto-package-update-maybe))

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

(use-package w3m
  :config
  (progn
    ;; 默认显示图片
    (setq w3m-default-display-inline-images t)
    (setq w3m-default-toggle-inline-images t)
    ;;显示图标
    (setq w3m-show-graphic-icons-in-header-line t)
    (setq w3m-show-graphic-icons-in-mode-line t)
    (setq w3m-use-cookies t)))

(provide 'init-package)
;;; init-package.el ends here
