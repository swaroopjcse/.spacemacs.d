;; custom -- Swaroop's spacemacs custom.el
;;
;;; Commentary:
;; This file contains the custom keybindings I like to use.
;;
;;

;; Toggle comments
(global-set-key (kbd "s-/") 'comment-line)

;; Center the point on the screen
(global-set-key (kbd "s-j") 'recenter-top-bottom)

;; Show mark ring
(global-set-key (kbd "s-M") 'helm-all-mark-rings)

;; Page up/down
(global-set-key (kbd "M-<down>") 'scroll-up)
(global-set-key (kbd "M-<up>") 'scroll-down)

;; Begin/end of line
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)

;; Up/down buffer
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

;; Jump to other window
(global-set-key (kbd "s-]") 'other-window)
(global-set-key (kbd "s-[") 'other-window)

;; Split and create new window on the left
(global-set-key (kbd "s-t") 'split-window-horizontally)

;; Map s-w to kill buffer instead of kill frame
(global-set-key (kbd "s-w") 'kill-buffer-and-window)

;; Find file at point
(global-set-key (kbd "s-<return>") 'find-file-at-point)

;; Open minibuffer
(global-set-key (kbd "s-b") 'helm-mini)

;; Open files using a more natural keybinding
(global-set-key (kbd "s-o") 'helm-find-files)

;; Spacemacs specific -- shortcut to jump between layouts
(global-set-key (kbd "s-1") 'spacemacs/layouts-transient-state/spacemacs/persp-switch-to-1)
(global-set-key (kbd "s-2") 'spacemacs/layouts-transient-state/spacemacs/persp-switch-to-2)
(global-set-key (kbd "s-3") 'spacemacs/layouts-transient-state/spacemacs/persp-switch-to-3)
(global-set-key (kbd "s-4") 'spacemacs/layouts-transient-state/spacemacs/persp-switch-to-4)
(global-set-key (kbd "s-5") 'spacemacs/layouts-transient-state/spacemacs/persp-switch-to-5)



