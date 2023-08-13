;;; uaihu.el --- uaihu
;;; Version: 1.0
;;; Commentary:
;;; Uaihu theme for emacs
;;; Code:

(deftheme uaihu "Uaihu theme for emacs")
  (custom-theme-set-faces 'uaihu
   '(default ((t (:foreground "#FFFFFF" :background "#1D1F27" ))))
   '(cursor ((t (:background "#FF5370" ))))
   '(fringe ((t (:background "#808080" ))))
   '(mode-line ((t (:foreground "#FFFFFF" :background "#2B2E3B" ))))
   '(region ((t (:background "#2B2E3B" ))))
   '(secondary-selection ((t (:background "#3E3834" ))))
   '(font-lock-builtin-face ((t (:foreground "#FFC107" ))))
   '(font-lock-comment-face ((t (:foreground "#FFFFFF" ))))
   '(font-lock-function-name-face ((t (:foreground "#FFC107" ))))
   '(font-lock-keyword-face ((t (:foreground "#FFC107" ))))
   '(font-lock-string-face ((t (:foreground "#FFFFFF" ))))
   '(font-lock-type-face ((t (:foreground "#FFFFFF" ))))
   '(font-lock-constant-face ((t (:foreground "#CDDC39" ))))
   '(font-lock-variable-name-face ((t (:foreground "#FFFFFF" ))))
   '(minibuffer-prompt ((t (:foreground "#FFFFFF" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "#FF5370" :bold t ))))
   )

;; Fill-column-indicator
(set-face-foreground 'fill-column-indicator "#2B2E3B")

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'uaihu)

;;; uaihu.el ends here
