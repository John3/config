;;; ide.el --- IDE Configuration
;;
;;; Commentary:
;; Mostly for C/C++.
;;
;; Packages:
;; =========
;; M-x package-install RET

;; yasnippet
;; auto-complete
;; auto-complete-c-headers
;; multiple-cursors OPT: iedit
;; ecb (See: key-bindings)
;; flycheck (C/C++ syntax checker using Clang.  Install Clang from from the OS.)
;; cede (built-in)
;; cmake-mode (You need to have cmake installed in your OS)
;; cpputils-cmake

;; =======================
;; OPT: flymake (built-in)
;; OPT: flymake-cppcheck
;; OPT: flymake-cursor
;; OPT: flymake-easy

;;; Code:
;;
;;; Initialize package
(package-initialize)

;; start yasnippet with emacs
;; should be loaded before auto-complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)

;; start auto-complete with emacs
(require 'auto-complete)
;; default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; set the trigger key so that it can work together with yasnippet on tab key,
;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; initialize auto-complete-c-headers
;; and call for c/c++ hooks
(defun acch:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  ;; donde se incluyen los archivos headers
  ;; gcc -xc++ -E -v - ; Para saber donde estan los include
  ;; (add-to-list 'achead:include-directories '"carpetas/include/headers/file"')
  ;; (add-to-list 'achead:include-directories '"/usr/lib/gcc/i686-pc-cygwin/4.8.3/include")
  )
;; call function from c/c++ hooks
(add-hook 'c++-mode-hook 'acch:ac-c-headers-init)
(add-hook 'c-mode-hook 'acch:ac-c-headers-init)

;; iedit
;; ===========
;; Usa por defecto "C-;" se puede cambiar por "C-c ;"
;; (define-key global-map (kbd "C-c ;") 'iedit-mode)

;; multiple-cursors
;; ================
;; Load by default
;; See key-binding.el
;;
;; (require 'multiple-cursors)

;; CEDET - buil-in
;; ================
;; turn on Semantic
(semantic-mode 1)

;; adds semantic as a suggestion to auto complete
;; hook this funcion to c-mode-common-hook
(defun cedet:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'cedet:add-semantic-to-autocomplete)
;; turn on ede mode
(global-ede-mode 1)
;; create a project for our program
;; (ede-cpp-root-project "my project" :file "/cygdrive/c/Users/Jonathan/Documents/CodeBlocksProject/sfml2.1/main.cpp"
;;                      :include-path '("/cygdrive/c/Users/Jonathan/Documents/CodeBlocksProject/sfml2.1/")
;;                      :include-path '("/cygdrive/c/SFML-2.1-build/lib"))

;; turn on automatic reparsing of open buffers in semantic
;;(global-semantic-idle-scheduler-mode 1)

;; flymake
;; =========
;; Syntax Checking on the fly
;; Flymake requires a makefile with the file name Makefile (capital M)
;; to use with it. Also, your makefile must contain the check-syntax target.
;; Add this to your makefile (use tab before gcc, not spaces)

;; check-syntax:
;;       gcc -o nul -S ${CHK_SOURCES}

;; Enable flymake upon opening any file
;; for which syntax checking is available.

;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; Config key bindings for quick navigation between errors:
;; flymake-display-err-menu-for-current-line
;; flymake-goto-next-error
;; flymake-goto-previous-error

;; flycheck
;; ========
;; A better flymake.

;; Enable flycheck for all the buffer, by default.
;; Global Flycheck Mode, Flycheck Mode is automatically enabled in all buffers,
;; for which a suitable syntax checker exists and is enabled.
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; cmake-mode
;; ==========
(setq load-path (cons (expand-file-name "/bin/cmake") load-path))
(require 'cmake-mode)


;;; ide.el ends here
