; M-x package-install RET
; auto-complete
; yasnippet
; auto-complete-c-headers
; iedit 
; OPT: flymake-cppcheck
; OPT: flymake-cursor
; Tal vez flymake-easy sea dependencia de cppcheck

; Initialize package
(package-initialize)

;; start auto-complete with emacs
(require 'auto-complete)
; default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

;; initialize auto-complete-c-headers
(defun acch:ac-c-header-init ()
	(require 'auto-complete-c-headers)
	(add-to-list 'ac-sources 'ac-source-c-headers)
	; donde se incluyen los archivos headers
	; gcc -xc++ -E -v - ; Para saber donde estan los include
	;(add-to-list 'achead:include-directories '"carpetas/include/headers/file"')
	(add-to-list 'achead:include-directories '"C:/Program Files (x86)/CodeBlocks/MinGW/lib/gcc/mingw32/4.8.1/include")
	)
; function from c/c++ hooks
(add-hook 'c++-mode-hook 'acch:ac-c-header-init)
(add-hook 'c-mode-hook 'accch:ac-c-header-init)

; iedit-mode
; usa por defecto C-; se puede cambiar por C-c ;
; (define-key global-map (kbd "C-c ;") 'iedit-mode)

; =====================================================

;; CEDET - buil-in 
; turn on Semantic
(semantic-mode 1)

; adds semantic as a suggestion to auto complete
; hook this funcion to c-mode-common-hook
(defun cedet:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'cedet:add-semantic-to-autocomplete)
; turn on ede mode
(global-ede-mode 1)
; create a project for our program
(ede-cpp-root-project "my project" :file "~/../../Documents/CodeBlocksProject/sfml2.1/main.cpp"
                      :include-path '("~/../../Documents/CodeBlocksProject/sfml2.1/")
                      :include-path '("C:/SFML-2.1-build/lib"))
; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

