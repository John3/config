;;; key-binding.el --- Key bindings configuration
;;
;;
;;; Commentary:
;;
;;
;;; Code:

;; multiple-cursors
;; ===================
;;
;; Experimental multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ;; Adds one cursor to each line in the current region.
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines) ;; Adds a cursor at the end of each line in the current region.
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines) ;; Adds a cursor at the start of each line in the current region.

;; Mark additional regions matching current region
;;(global-set-key (kbd "M-æ") 'mc/mark-all-dwim)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-all-like-this)
(global-set-key (kbd "C-<") 'mc/unmark-next-like-this) ; Remove the cursor furthest down in the buffer.
(global-set-key (kbd "C-M-,") 'mc/mark-more-like-this-extended) ;Use arrow keys to quickly mark/skip next/previous occurances.
(global-set-key (kbd "C-'") 'mc/mark-all-in-region) ;Prompts for a string to match in the region, adding cursors to all of them.

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Extra multiple cursors stuff
;(global-set-key (kbd "C-~") 'mc/reverse-regions) ; Reverse the order of the marked regions
;(global-set-key (kbd "C-`'") 'mc/sort-regions)   ; Sort the marked regions alphabetically.
;global-set-key (kbd "M-~") 'mc/insert-numbers)  ; Insert increasing numbers for each cursor, top to bottom.

;; Symbol and word specific mark-more
;(global-set-key (kbd "s-æ") 'mc/mark-next-word-like-this)
;(global-set-key (kbd "s-å") 'mc/mark-previous-word-like-this)
;(global-set-key (kbd "M-s-æ") 'mc/mark-all-words-like-this)
;(global-set-key (kbd "s-Æ") 'mc/mark-next-symbol-like-this)
;(global-set-key (kbd "M-s-Æ") 'mc/mark-all-symbols-like-this)
;; ==============================================================

;;; key-bindings.el ends here
