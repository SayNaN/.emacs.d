;;; init-ui.el --- settings for the Emacs UI

;;; Commentary:
;;; (c) Cabins, github.com/cabins/.emacs.d

    ;;; Code:

;; blink the cursor
(blink-cursor-mode t)

(global-hl-line-mode t)

;; Function to set monofonts
(defun cabins/set-monospaced-font (english chinese e-size c-size)
  "cabins/set-monospaced-font is used for setting monospaced font of ENGLISH and CHINESE"
  (set-face-attribute 'default nil
                      :font (font-spec
                             :name english
                             :weight 'normal
                             :slant 'normal
                             :size e-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec
                       :name chinese
                       :weight 'normal
                       :slant 'normal
                       :size c-size))))

;; 尝试解决字体卡顿问题
(setq inhibit-compacting-font-caches t)

;; 解决Deamon启动的时候，字体不能加载的问题
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (if (window-system frame)
                (cabins/set-monospaced-font "Ubuntu Mono" "华文细黑" 13 14))))

;; Font settings
(use-package emacs
  :when (display-graphic-p)
  :config
  (setq-default cursor-type 'box)
  ;; I prefer the cursor be red color, 'cause it's more obvious.
  ;; (set-face-background 'cursor "#FF0000")
  (setq-default scroll-up-aggressively 0.01
                scroll-down-aggressively 0.01)
  (setq default-frame-alist '((width . 180) (height . 40)))
  (setq redisplay-dont-pause t
        scroll-conservatively most-positive-fixnum
        scroll-margin 1
        scroll-step 1
        scroll-preserve-screen-position 'always)
)

(provide 'init-ui)
;;; init-ui.el ends here.
