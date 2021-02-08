;;; init-defaultsetting.el --- Works when startup Emacs

;;; Commentary:
;;; (c) Cabins, github.com/cabins/.emacs.d

;;; Code:

;; Settings for system encoding
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(when (eq system-type 'windows-nt)
  (setq locale-coding-system 'gb18030
        w32-unicode-filenames 'nil
        file-name-coding-system 'gb18030)
  (set-next-selection-coding-system 'utf-16-le)
  (set-selection-coding-system 'utf-16-le)
  (set-clipboard-coding-system 'utf-16-le))


;; Settings for backup files
(setq make-backup-files nil
      auto-save-default nil)

;; Adjust garbage collection thresholds during startup
(setq-default frame-title-format '("%f"))

(setq inhibit-startup-screen t)
;;(setq initial-scratch-message (cabins/user-login-info))

;; I don't like the bell ring
(setq ring-bell-function #'ignore
      visible-bell nil)

(if *is-mac*
    (setq delete-by-moving-to-trash t))

;; 快速打开配置文件
(defun open-trick-file()
  (interactive)
  (find-file "~/.emacs.d/trick/trick.org"))

;; 这一行代码，将函数 open-init-file 绑定到 <f1> 键上
(global-set-key (kbd "<f1>") 'open-trick-file)

;; 自动加载外部修改过的文件
(global-auto-revert-mode t)

;; 启用唯一的dired窗口
(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 空白现实
(global-whitespace-mode t)

;; Settings for the TAB behavior
(setq-default tab-width 4
              indent-tabs-mode nil) ;; tab改为插入空格

;; c c++ 缩进4个空格
(setq c-basic-offset 4)

;; 没有这个{}就会瞎搞
(setq c-default-style "linux")

(provide 'init_mySetting)
;;; init-defaultsetting.el ends here
