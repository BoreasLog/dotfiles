(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(set-fringe-mode 10)
(set-face-attribute 'default nil :height 110)
(global-unset-key (kbd "C-z"))

(windmove-default-keybindings)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See
;; `package-archive-priorities`
;; ;; and `package-pinned-packages`. Most users will not need or want to do
;; this.
;;(add-to-list 'package-archives '("melpa-stable"
;; . "https://stable.melpa.org/packages/") t)
 (package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(display-line-numbers-mode 1)

(require 'use-package)
(setq use-package-always-ensure t)

(use-package try
  :ensure t)


(use-package swiper
  :ensure t)
(use-package doom-themes
  :ensure t
  :init(load-theme 'doom-fairy-floss t))


(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package diminish
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-pervious-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

(use-package ivy-rich
  :ensure t
  :init
  (ivy-rich-mode 1)) 

(use-package counsel
  :ensure t 
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-function-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)  
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package undo-tree
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-tree)
  :config  
  (evil-mode 1)
  (define-key evil-insert-state-map(kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map(kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

;;  (evil-set-initial-state 'message-buffer-mode 'nomral)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
    :after evil
    :config
    (evil-collection-init))



(require 'evil)

(use-package org
  :config 
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
	'(
	  "~/.emacs.d/OrgFiles/Classes.org"
	  "~/.emacs.d/OrgFiles/Tasks.org")))

(use-package olivetti
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (olivetti-mode 1))))

 (use-package org-superstar  ;; Improved version of org-bullets
   :ensure t
   :config
   (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))
  
 (setq org-startup-indented t)           ;; Indent according to section
 (setq org-startup-with-inline-images t) ;; Display images in-buffer by default


 (use-package evil-org
   :ensure t
   :after (evil org)
   :config
   (add-hook 'org-mode-hook 'evil-org-mode)
   (add-hook 'evil-org-mode-hook
             (lambda ()
               (evil-org-set-key-theme '(navigation insert textobjects additional calendar))))
   (require 'evil-org-agenda)
   (evil-org-agenda-set-keys))

(customize-set-variable 'ispell-program-name "aspell")
(customize-set-variable 'ispell-extra-args '("--sug-mode=ultra"))
(add-hook 'text-mode-hook 'flyspell-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#5a5475" "#CC6666" "#C2FFDF" "#FFEA00" "#55b3cc" "#FFB8D1" "#96CBFE" "#F8F8F0"])
 '(custom-safe-themes
   '("b3f43687b0453c29f5da6448270aabee8f686c30cc0951c5e24b8d9be6b426e0" "5bea0ffe17e0c863a88c20e412c3238955c4659314a76dcf5e3af8049b0cfb53" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" default))
 '(exwm-floating-border-color "#282633")
 '(fci-rule-color "#B8A2CE")
 '(highlight-tail-colors ((("#64657f") . 0) (("#605f82") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#464258" "#C5A3FF"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#464258" "#C2FFDF"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#464258" "#656565"))
 '(objed-cursor-color "#CC6666")
 '(org-agenda-files
   '("/home/jack/.emacs.d/OrgFiles/Classes.org" "/home/jack/.emacs.d/OrgFiles/Tasks.org" "/home/jack/journal/life.org"))
 '(package-selected-packages
   '(olivetti org-krita krita-org org-roam doom-modeline advice-patch pdf-tools pdflatex latex-preview-pane org-table yasnippet cdlatex preview auctex evil-org org-superstar helpful evil-collection ivy-rich evil diminish rainbow-delimiters doom-themes swiper ivy try use-package sly))
 '(pdf-view-midnight-colors (cons "#F8F8F0" "#5a5475"))
 '(rustic-ansi-faces
   ["#5a5475" "#CC6666" "#C2FFDF" "#FFEA00" "#55b3cc" "#FFB8D1" "#96CBFE" "#F8F8F0"])
 '(vc-annotate-background "#5a5475")
 '(vc-annotate-color-map
   (list
    (cons 20 "#C2FFDF")
    (cons 40 "#d6f894")
    (cons 60 "#eaf14a")
    (cons 80 "#FFEA00")
    (cons 100 "#f6dc00")
    (cons 120 "#eece00")
    (cons 140 "#E6C000")
    (cons 160 "#eebd45")
    (cons 180 "#f6ba8b")
    (cons 200 "#FFB8D1")
    (cons 220 "#ee9cad")
    (cons 240 "#dd8189")
    (cons 260 "#CC6666")
    (cons 280 "#b26565")
    (cons 300 "#986565")
    (cons 320 "#7e6565")
    (cons 340 "#B8A2CE")
    (cons 360 "#B8A2CE")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 0))))

  (require 'diminish)
