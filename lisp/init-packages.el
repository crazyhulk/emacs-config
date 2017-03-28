(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t))

(require 'cl)
;;add whatever packages you want here
(defvar zhuxi/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 popwin
			 ) "Default packages")

(setq package-selected-packages zhuxi/packages)


(defun zhuxi/packages-installed-p ()
  (loop for pkg in zhuxi/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (zhuxi/packages-installed-p)
  (message "%s" "Refreshing packages database...")
  (package-refresh-contents)
  (dolist (pkg zhuxi/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;;;;;;;;;;;;;;;;;;;;;;;package init complete;;;;;;;;;;;;;;;;;;
;;hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode t)

;;swiper 
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;js default js2-model
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;;;;;;;popwin;;;;;
(require 'popwin)
(popwin-mode t)

;;auto reload file when file changes by other
(global-auto-revert-mode t)

;;;;;;;;;;;;;;;;;;;Set sublime theme;;;;;;;;;;;;;;;;
(load-theme 'monokai t)



;;smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(provide 'init-packages)
