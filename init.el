
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  )
(require 'cl)

;;add whatever packages you want here
(defvar jzaustin/packages '(
			    company
			    monokai-theme
			    hungry-delete
			    ;smex
			    swiper
			    counsel
			    smartparens
			    js2-mode
;			    nodejs-repl
;			    exec-path-from-shell
			    )  "Default packages")
				
;;(setq package-selected-packages jzaustin/packages)

(defun jzaustin/packages-installed-p ()
  (loop for pkg in jzaustin/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (jzaustin/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg jzaustin/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
					;配置环境变量
;(when (memq window-system '(mac ns))
;  (exec-path-from-shell-initialize))

;关闭工具栏
(tool-bar-mode -1)
;关闭滚动条
(scroll-bar-mode -1)
;显示行号
(global-linum-mode t)
;关闭启动画面
(setq inhibit-splash-screen t)
;绑定f2快捷键
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
;设置自动补全
(global-company-mode t)
;设置光标
(setq-default cursor-type 'bar)
;关闭备份文件
(setq make-backup-files nil)
;添加语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;开启recentf模式
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;开启delete-mode
(delete-selection-mode t)

;开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;开启括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;高亮显示当前行
(global-hl-line-mode t)

;加载monokai-theme
(load-theme 'monokai )

;设置smex
;(require 'smex)
;(smex-initialize)
;(global-set-key (kbd "M-x") 'smex)

;配置smartparens
(require 'smartparens-config)
(smartparens-global-mode t)



;设置swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;配置js2-mode 
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))

;org-mode配置
(setq org-agenda-files '("D:/Documents/org/"))
(global-set-key (kbd "C-c a" ) 'org-agenda)
