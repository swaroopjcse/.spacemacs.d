(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; Use org mode for archive files as well
(add-to-list 'auto-mode-alist '("\\.org_archive$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/Documents/org/main.org"
                             "~/Documents/org/notes.org"
                             "~/Documents/org/someday.org"))
(setq org-log-done t)
(setq org-directory "~/Documents/org")

(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/Documents/org/main.org" "Tasks")
         "** TODO %?\t%^G\n  Created: %U\n\n")
        ("s" "Someday" entry (file+headline "~/Documents/org/someday.org" "Things to Do")
         "*** %?\n Created: %U\n\n")
        ("n" "Note" entry (file+datetree "~/Documents/org/notes.org")
         "* %?\t%^G\n  Created: %U\n  %i\n\n")
        ("e" "Email" entry (file+headline "~/Documents/org/main.org" "Tasks")
         "** TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

(setq org-refile-targets (quote (("~/Documents/org/main.org" :maxlevel . 1)
                                 ("~/Documents/org/someday.org" :level . 2))))

(defun gtd ()
  (interactive)
  (find-file "~/Documents/org/main.org")
  )
(global-set-key (kbd "C-c g") 'gtd)
(global-set-key (kbd "s-e") #'org-capture)

;; Allows alphabetical lists
(setq org-list-allow-alphabetical t)

;; GTD Context org-agenda configuration
;; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
(setq org-agenda-custom-commands
      '(("g" . "GTD contexts")
        ("go" "Office" tags-todo "@OFFICE")
        ("gh" "Home" tags-todo "@HOME")
        ("gr" "Research" tags-todo "RESEARCH")
        ("gt" "Teaching" tags-todo "TEACHING")
        ("gs" "Sangha" tags-todo "SANGHA")
        ("ge" "Errands" tags-todo "ERRANDS")
        ("G" "GTD Block Agenda"
         ((tags-todo "@OFFICE")
          (tags-todo "@HOME")
          (tags-todo "RESEARCH")
          (tags-todo "TEACHING")
          (tags-todo "SANGHA")
          (tags-todo "ERRANDS"))
         nil                      ;; i.e., no local settings
         ("~/Documents/org/next-actions.html"))
        ("D" "Daily Action List"
         (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
        )
      )

(global-set-key (kbd "s-.") 'org-capture-finalize)

;; From norang https://duckduckgo.com/l/?kh=-1&uddg=http%3A%2F%2Fdoc.norang.ca%2Forg%2Dmode.html
(require 'org-crypt)
                                        ; Encrypt all entries before saving
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
                                        ; GPG key to use for encryption
(setq org-crypt-key "7B8810EF0F59C496C78F8EF15C07A55E01FCA00C")
