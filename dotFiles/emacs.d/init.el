;; upgrade org-mode before all else
(add-to-list 'load-path "~/.emacs.d/vendor/org-9.1.2/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor/org-9.1.2/contrib" t)
;; WARNING - for efficiency it is highly recommended to run `make
;; compile` in the org-mode directory

;; set up the various repositories
(setq package-archives
      '(("GNU ELPA"     . "http://elpa.gnu.org/packages/")
	("MELPA Stable" . "https://stable.melpa.org/packages/")
	("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
	("GNU ELPA"     . 5)
	("MELPA"        . 0)))
(package-initialize)
;; quelpa
(package-initialize)
(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

;; use use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; provide access to our modules
(add-to-list 'load-path "~/.emacs.d/elisp")

;; setup some sensible defaults
(require 'cy-defaults)
(require 'cy-key-chord)
(require 'cy-functions)
(require 'cy-line-handling)
;; now the various packages
(require 'cy-clojure)
;;(require 'cy-reasonml)
(require 'cy-deft)
(require 'cy-yaml)
(require 'cy-company)
;; (require 'cy-hugo-blog)
(require 'cy-evil)
(require 'cy-fish)
(require 'cy-ivy)
(require 'cy-mail)
(require 'cy-projectile)
(require 'cy-project-tree)
(require 'cy-ui)
;; (require 'cy-base16-harmonic-light-theme)
;; (require 'cy-zenburn-theme)
(require 'cy-leuven-theme)
(require 'cy-version-control)
(require 'cy-yasnippets)

;; finally, install the keybindings
(require 'cy-keybindings)

;; always recompile for extra speed next time ;-)
(defun cy/recompile-elc ()
  (interactive)
  ;; byte-recompile-directory doesn't support exclusions
  ;; TODO - how to get a list and then loop through that?
  (byte-recompile-directory (expand-file-name "~/.emacs.d/elisp") 0)
  (byte-recompile-directory (expand-file-name "~/.emacs.d/my-snippets") 0)
  (byte-recompile-file (expand-file-name "~/.emacs.d/init.el") 0))
;; disabling due to https://github.com/yatesco/dotEmacs/issues/1
;; (cy/recompile-elc)

;; let everyone know we are done
(message (concat "Emacs loaded in " (emacs-init-time) ", go wild!"))
(message "Go wild!")
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
