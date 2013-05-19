(require 'kl_color-theme-zenburn)
(color-theme-zenburn)

;; https://github.com/jlr/rainbow-delimiters
;; The stock rainbow-delimiters colors are overridden by at least some
;; versions of the Zenburn theme including my hacked one

;; also check the git version for emacs24 -
;; https://github.com/djcb/elisp/blob/master/themes/zenburn-theme.el

(require 'rainbow-delimiters nil 'noerror) 
;  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(global-rainbow-delimiters-mode)

(setq font-lock-maximum-decoration t)

(setq-default transient-mark-mode t)
(setq-default global-font-lock-mode t)

;; http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
              (list
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize " %b " 'face 'font-lock-keyword-face
                                   'help-echo (buffer-file-name)))
               
               ;; line and column
               "(" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02l" 'face 'font-lock-type-face) ","
               (propertize "%02c" 'face 'font-lock-type-face) 
               ") "
               
               ;; relative position, size of file
               "["
               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-constant-face) ;; size
               "] "
               
               ;; the current major mode for the buffer.
               "["
               
               '(:eval (propertize "%m" 'face 'font-lock-string-face
                                   'help-echo buffer-file-coding-system))
               "] "
               
               
               "[" ;; insert vs overwrite mode, input-method in a tooltip
               '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                   'face 'font-lock-preprocessor-face
                                   'help-echo (concat "Buffer is in "
                                                      (if overwrite-mode "overwrite" "insert") " mode")))
               
               ;; was this buffer modified since the last save?
               '(:eval (when (buffer-modified-p)
                         (concat ","  (propertize "Mod"
                                                  'face 'font-lock-warning-face
                                                  'help-echo "Buffer has been modified"))))
               
               ;; is this buffer read-only?
               '(:eval (when buffer-read-only
                         (concat ","  (propertize "RO"
                                                  'face 'font-lock-type-face
                                                  'help-echo "Buffer is read-only"))))  
               "] "
               
               ;; add the time, with the date and the emacs uptime in the tooltip
               '(:eval (propertize (format-time-string "%H:%M")
                                   'help-echo
                                   (concat (format-time-string "%c; ")
                                           (emacs-uptime "Uptime:%hh"))))
               " --"
               ;; i don't want to see minor-modes; but if you want, uncomment this:
               minor-mode-alist  ;; list of minor modes
               "%-" ;; fill with '-'
               ))



(provide 'visual-tweaks)
