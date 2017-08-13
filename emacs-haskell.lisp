;;
;; Trying to extract awesome Spacemacs Hskell Layer
;; New to Emacs and Haskell need some help

;; haskell-mode, I am totally lost with this one
(use-package haskell-mode
    :ensure t
    :init
    )
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; hident
(use-package hindent
    :defer t
    :if (stringp haskell-enable-hindent-style)
    :init
    (add-hook 'haskell-mode-hook #'hindent-mode)
    :config
    (progn
        (setq hindent-style haskell-enable-hindent-style)))

;; Where does this go?
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Flycheck
(use-package flycheck
    :ensure t
    :commands flycheck-haskell-configure
    :init
    (add-hook 'flycheck-mode-hook 'flycheck-haskell-configure)
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; Flycheck haskell !!!
(use-package flycheck-haskell
    :ensure t
    :commands
    flycheck-haskell-configure
    :init
    (add-hook 'flycheck-mode-hook 'flycheck-haskell-configure))

;; ghc relaterd, where do they go?
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; company
(use-package company
    :ensure t
    :init
    (add-hook 'haskell-mode-hook 'company-mode)
    :config
    (add-to-list 'company-backends 'company-ghc)
    (custom-set-variables '(company-ghc-show-info t)))

;; company-ghci
(use-package company-ghci
    :ensure t
    :defer t)

;; company-ghc
(use-package company-ghc
    :ensure t
    :defer t)

;; ghc
(use-package ghc
    :ensure t
    :defer t)

;; hlint-refactor
(use-package hlint-refactor
    :ensure t
    :defer t)

;; intero
(use-package intero
    :ensure t
    :defer t
    :init
    (add-hook 'haskell-mode-hook 'intero-mode)
)

;; haskell-snippets
(use-package haskell-snippets
    :ensure t)

;; ggtags
(use-package ggtags
    :ensure t)

;; ghci process within emacs
;; (custom-set-variables '(haskell-process-type 'cabal-repl))
(custom-set-variables '(haskell-process-type 'stack-ghci))

;; Where does this go?
(custom-set-variables '(haskell-tags-on-save t))