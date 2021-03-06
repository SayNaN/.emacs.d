;;; init-org --- initialize the plugins

;; Settings for org mode and load config from org file
(use-package org
  ;; :init (setq org-startup-indented t)
  :config
  (progn
    (setq org-startup-indented t
	      org-todo-keywords '((sequence "TODO" "DOING" "DONE"))
	      org-todo-keyword-faces '(("DOING" . "blue")))

    (setq org-log-done 'note)

    (global-set-key (kbd "C-c a") 'org-agenda)
    (global-set-key (kbd "C-c c") 'org-capture)

    ;; tell org-mode where to find the plantuml JAR file (specify the JAR file)
    (setq org-plantuml-jar-path
          (expand-file-name "~/Downloads/plantuml.jar"))

    ;; use plantuml as org-babel language
    (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

    ;; helper function
    (defun my-org-confirm-babel-evaluate (lang body)
      "Do not ask for confirmation to evaluate code for specified languages."
      (member lang '("plantuml")))

    ;; trust certain code as being safe
    (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

    ;; automatically show the resulting image
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
    )
  :hook (org-mode . (lambda()
	    (setq truncate-lines nil)))
)

(provide 'init-org)
;;; init-org.el ends here
