;;enables packages via M-x package-install
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Force using aproximate colors when in terminal of the theme being used
;;(autoload 'color-theme-approximate-on "color-theme-approximate")
;;(color-theme-approximate-on)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(speedbar-default-position (quote right))
 '(word-wrap nil)
)


;;auto indent rather than just a newline
(add-hook 'c-mode-common-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))
(define-key global-map (kbd "RET") 'newline-and-indent)
;;auto indents when you paste files
 (dolist (command '(yank yank-pop))
       (eval `(defadvice ,command (after indent-region activate)
                (and (not current-prefix-arg)
                     (member major-mode '(emacs-lisp-mode lisp-mode
                                                          clojure-mode    scheme-mode
                                                          haskell-mode    ruby-mode
                                                          rspec-mode      python-mode
                                                          c-mode          c++-mode
                                                          objc-mode       latex-mode
                                                          plain-tex-mode))
                     (let ((mark-even-if-inactive transient-mark-mode))
                       (indent-region (region-beginning) (region-end) nil))))))

;;turn off the horrible word wrap crap
(setq-default truncate-lines 1)

;;enable cua mode:  normal Ctrl-C/X/Z/V
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing


(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression

(global-linum-mode 1) ; display line numbers in margin. Emacs 23 only.


(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

(column-number-mode 1) ;; always show position in file (line#, char #)

(recentf-mode 1) ; keep a list of recently opened files


;;Printing on windows.  Uses Ghostscript
(setenv "GS_LIB" "C:/Program Files/gs/gs9.07/lib;C:/Program Files/gs/gs9.07/lib/fonts")
(setq ps-lpr-command "C:/Program Files/gs/gs9.07/bin/gswin64c.exe")
(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
(setq ps-printer-name t)


;;maybe show debugging trace
(setq debug-on-error t)

;stop asking if i want to kill a buffer:  YES i do, otherwise i wouldnt have hit "C-x k"
(global-set-key (kbd "C-x k") (lambda ()
	(interactive)
	(kill-buffer (buffer-name))))

;Also, if i want to quit:  quit without saving
(defun my-kill-emacs ()
  "exit unconditionally"
  (interactive)
  ;(save-some-buffers nil t)
  (kill-emacs))

(global-set-key (kbd "C-x C-c") 'my-kill-emacs)

;disable overwrite mode
(put 'overwrite-mode 'disabled t)
;C-c C-a selects all
(global-set-key "\C-c\C-a" 'mark-whole-buffer)
; never use tabs, always use spaces
(setq-default indent-tabs-mode nil)
;(setq frame-title-format "emacs - %b")
(setq frame-title-format '(buffer-file-name " %f" ("%b")))

; pop up speedbar when emacs is under a window system
(when window-system ; not just X
  (speedbar 1))

;mouse wheel scrolling
(if (load "mwheel" t)
    (mwheel-install))

;clicking on urls in man pages goes there
(add-hook 'Man-mode-hook 'goto-address)

;always auto-compile .emacs
(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name) (expand-file-name (concat default-directory ".emacs")))
      (byte-compile-file (buffer-file-name))))
(add-hook 'after-save-hook 'autocompile)

;Enable CSV mode
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(add-to-list 'auto-mode-alist '("\\C*.[1-9]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode" "Major mode for editing comma-separated value files." t)

; bind hippie-expand to meta-F1
(global-set-key [(meta f1)] (make-hippie-expand-function
                             '(try-expand-dabbrev-visible
                               try-expand-dabbrev
                               try-expand-dabbrev-all-buffers) t))

;auto revert
(global-auto-revert-mode 1)
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)


;ido is the useful mode for opening files, etc
(require 'ido)
(ido-mode t)
(setq ido-ignore-buffers '("^\*Messages\*"))

;These allow the user to use ctrl-page up / page down to flip through buffers

(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-emacs-buffer ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))


;now add keybindings
(global-set-key (kbd "<f11>") 'find-file) ; Open file or dir
(global-set-key (kbd "<f12>") 'kill-this-buffer) ; Close file

(global-set-key (kbd "<C-prior>") 'previous-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "<C-next>") 'next-user-buffer) ; Ctrl+PageDown
(global-set-key (kbd "<C-S-prior>") 'previous-emacs-buffer) ; Ctrl+Shift+PageUp
(global-set-key (kbd "<C-S-next>") 'next-emacs-buffer) ; Ctrl+Shift+PageDown
;default buffer lister should be ibuffer
(defalias 'list-buffers 'ibuffer)
