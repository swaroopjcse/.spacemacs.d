;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (mu4e :variables
           mu4e-installation-path "/usr/local/Cellar/mu/1.0_1/share/emacs/site-lisp/mu/mu4e/"
           mu4e-enable-mode-line t
           mu4e-enable-notifications t)
     rust
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     haskell
     shell-scripts
     graphviz
     (python      :variables python-enable-yapf-format-on-save t
                  python-test-runner 'pytest
                  python-fill-column 99
                  python-sort-imports-on-save t)
     java
     (scala       :variables scala-enable-eldoc t
                  scala-auto-insert-asterisk-in-comments t
                  scala-auto-start-ensime t)
     csv
     javascript
     yaml
     html
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t)
     ;; better-defaults
     emacs-lisp
     git
     github
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     osx
     (bibtex :variables
             bibtex-autokey-year-length 4
             bibtex-autokey-name-year-separator "-"
             bibtex-autokey-year-title-separator "-"
             bibtex-autokey-titleword-separator "-"
             bibtex-autokey-titlewords 2
             bibtex-autokey-titlewords-stretch 1
             bibtex-autokey-titleword-length 5)
     (latex :variables
            latex-enable-auto-fill t
            latex-enable-folding t
            TeX-source-correlate-mode t
            TeX-source-correlate-start-server t
            TeX-source-correlate-method 'synctex
            TeX-view-program-list
            '(("Okular" "okular --unique %o#src:%n`pwd`/./%b")
              ("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")
              ("Zathura"
               ("zathura %o"
                (mode-io-correlate
                 " --synctex-forward %n:0:%b -x \"emacsclient +%{line} %{input}\"")))))
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     nlinum
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(treemacs treemacs-projectile yankpad define-word)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile company)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '( spacemacs-light spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  (push '("ensime" . "melpa-stable") package-pinned-packages)

  ;; Set the spell check program
  (setq ispell-program-name "/usr/local/bin/aspell")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; From http://spacemacs.org/layers/+lang/scala/README.html
  (setq flycheck-scalastyle-jar
        "/usr/local/Cellar/scalastyle/0.8.0/libexec/scalastyle_2.11-0.8.0-batch.jar")
  (setq flycheck-scalastylerc
        "/usr/local/etc/scalastyle_config.xml")

  ;; Importing some customizations from scimax
  ;; https://github.com/jkitchin/scimax
  ;; (setq scimax-dir "/Users/swaroop/Downloads/scimax")
  ;; (add-to-list 'load-path "/Users/swaroop/Downloads/scimax")

  (display-time-mode t)
  (display-battery-mode t)

  (setq exec-path (append exec-path '("/usr/local/bin")))

  (setq eclim-eclipse-dirs "/Applications/Eclipse.app//Contents/MacOS/eclipse"
        eclim-executable "/Applications/Eclipse.app//Contents/Eclipse/plugins/org.eclim_2.8.0/bin/eclim")

  ;; (add-hook 'java-mode-hook 'scala/configure-ensime)
  ;; (add-hook 'java-mode-hook 'scala/maybe-start-ensime)

  ;; treemacs related variables
  (setq treemacs-use-follow-mode t
        treemacs-use-filewatch-mode t)

;;; this file contains my custom keybindings
  (load-file "~/.spacemacs.d/custom.el")

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; mu4e configuration
  (with-eval-after-load 'mu4e
    (setq mu4e-maildir "~/.mail"
          mu4e-sent-folder   "/ieee/Sent Mail"       ;; folder for sent messages
          mu4e-drafts-folder "/ieee/Drafts"     ;; unfinished messages
          mu4e-trash-folder  "/ieee/Trash"      ;; trashed messages
          mu4e-refile-folder "/archive"    ;; refile
          mu4e-attachment-dir  "~/Downloads"
          mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout" ;; only on osx - see mu4e manual for details
          mu4e-get-mail-command "offlineimap -c ~/.spacemacs.d/offlineimaprc"
          mu4e-update-interval nil ;;number of seconds between the updates. If
          ;;set to nil, it won’t update at all
          mu4e-index-cleanup nil      ;; don't do a full cleanup check
          mu4e-index-lazy-check t     ;; don't consider up-to-date dirs
          mu4e-compose-complete-addresses t ;; nil to disable
          mu4e-compose-signature-auto-include t
          mu4e-view-show-images t
          mu4e-view-show-addresses t
          mu4e-user-mail-address-list '("swaroopjoshi@ieee.org")
          mu4e-compose-reply-to-address "swaroopjoshi@ieee.org"
          user-mail-address "swaroopjoshi@ieee.org"
          user-full-name  "Swaroop Joshi"
          mu4e-compose-signature "Swaroop"
          mu4e-headers-fields '((:human-date . 15) ;; or use :date
                                (:flags      . 6)
                                (:from-or-to . 22)
                                (:subject    . nil)) ;; or use :thread-subject
          ;; mu4e-view-hide-cited '#
          message-kill-buffer-on-exit t
          mu4e-compose-dont-reply-to-self t
          mail-user-agent 'mu4e-user-agent ;; mu4e is the default email program of emacs

          ;; smtp
          message-send-mail-function 'smtpmail-send-it
          ;; smtpmail-auth-credentials (expand-file-name "~/.spacemacs.d/authinfo.gpg")
          ;; simply put credentials in .authinfo.gpg instead
          smtpmail-default-smtp-server "smtp.gmail.com"
          smtpmail-smtp-server "smtp.gmail.com"
          smtpmail-local-domain "gmail.com"
          smtpmail-smtp-service 465
          smtpmail-stream-type 'tls
          mu4e-sent-messages-behavior 'delete
          ))

  ;; Set the proper ditaa path
  ;; See https://www.johndcook.com/blog/2016/06/15/ascii-art-diagrams-in-emacs-org-mode/
  ;; (setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.10/libexec/ditaa0_10.jar")
  (with-eval-after-load 'org
    (setq org-directory "~/org")
    (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
    (setq org-enable-github-support t)
    (setq org-default-notes-file (concat org-directory "/inbox.org"))

    (setq org-agenda-files '("~/org/inbox.org"
                             "~/org/gtd.org"
                             "~/org/tickler.org"
                             "~/git/oup-android-book/androidbook.org"))

    (setq org-capture-templates
          '(("t" "Todo [inbox]" entry
             (file+headline "~/org/inbox.org" "Tasks")
             "* TODO %i%?")
            ("k" "Tickler" entry
             (file+headline "~/org/tickler.org" "Tickler")
             "* %i%? \n %^t")
            ("q" "Quote" entry
             (file+headline "~/org/quotes.org" "Quote")
             "* %i%? %^g \n #+BEGIN_VERSE \n #+END_VERSE  \n %u")
            ("j" "Journal" entry
             (file+datetree "~/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

    (setq org-refile-targets '(("~/org/gtd.org" :maxlevel . 2)
                               ("~/org/someday.org" :level . 1)
                               ("~/org/tickler.org" :maxlevel . 1)))

    (setq org-todo-keywords
          '((sequence "TODO(t)" "STARTED(s)" "PAUSED(p)" "|" "DONE(d)" "CANCELLED(c)")))
    (setq org-enforce-todo-dependencies t)

    ;; Default parameters for agenda clockreport -- other options at
    ;; https://www.gnu.org/software/emacs/manual/html_node/org/The-clock-table.html
    (setq org-agenda-clockreport-parameter-plist '(:maxlevel 2 :link t :formula %))
    ;; Change tasks to whatever when clocking in and out
    (setq org-clock-in-switch-to-state "STARTED")
    (setq org-clock-out-switch-to-state "PAUSED")
    ;; Save clock data and state changes and notes in the LOGBOOK drawer
    (setq org-clock-into-drawer t)
    ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks
    ;; with 0:00 duration
    (setq org-clock-out-remove-zero-time-clocks t)
    ;; Clock out when moving task to a done state
    (setq org-clock-out-when-done t)
    ;; Enable auto clock resolution for finding open clocks
    (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
    ;; Include current clocking task in clock reports
    (setq org-clock-report-include-clocking-task t)
    ;; use pretty things for the clocktable
    (setq org-pretty-entities t)

    (org-babel-do-load-languages
     'org-babel-load-languages '((python . t)
                                 (ditaa . t)
                                 (scala . t)))

    (use-package yankpad
      :ensure t
      :defer 10
      :init
      (setq yankpad-file "~/.spacemacs.d/yankpad.org"))

    ;; From norang https://duckduckgo.com/l/?kh=-1&uddg=http%3A%2F%2Fdoc.norang.ca%2Forg%2Dmode.html
    (require 'org-crypt)
                                        ; Encrypt all entries before saving
    (org-crypt-use-before-save-magic)
    (setq org-tags-exclude-from-inheritance (quote ("crypt")))
                                        ; GPG key to use for encryption

    ;; https://emacs.stackexchange.com/questions/32225/latex-export-uses-lstlisting-instead-of-minted-why
    (setq org-export-latex-listings 'listings
          org-latex-packages-alist '(("" "listings")))
    ;; GPG key to use for encryption
    ;; Either the Key ID or set to nil to use symmetric encryption.
    (setq org-crypt-key nil)
    ;; (setq org-crypt-key "7B8810EF0F59C496C78F8EF15C07A55E01FCA00C")

    ;; Auto-saving does not cooperate with org-crypt.el: so you need
    ;; to turn it off if you plan to use org-crypt.el quite often.
    ;; Otherwise, you'll get an (annoying) message each time you
    ;; start Org.

    ;; To turn it off only locally, you can insert this:
    ;;
    ;; # -*- buffer-auto-save-file-name: nil; -*-
    (setq auto-save-default nil)
    )


  ;; From https://stackoverflow.com/a/44966680/3259704
  ;; (setq org-latex-image-default-width "")

  ;; Syntex with skim from https://mssun.me/blog/spacemacs-and-latex.html
  (cond
   ((string-equal system-type "darwin")
    (progn (setq TeX-view-program-selection '((output-pdf "Skim")))))
   ((string-equal system-type "gnu/linux")
    (progn (setq TeX-view-program-selection '((output-pdf "Okular"))))))
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-list
        '(("Okular" "okular --unique %o#src:%n`pwd`/./%b")
          ("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")
          ("Zathura"
           ("zathura %o"
            (mode-io-correlate
             " --synctex-forward %n:0:%b -x \"emacsclient +%{line} %{input}\"")))))

  ;; From https://github.com/syl20bnr/spacemacs/issues/9603
  ;; (org-defkey org-mode-map [(meta return)] 'org-meta-return)

  ;; Bind clang-format-buffer to tab on the c++-mode only:
  ;; (add-hook 'c++-mode-hook 'clang-format-bindings)
  ;; (defun clang-format-bindings ()
  ;; (define-key c++-mode-map [tab] 'clang-format-buffer))

  ;; (global-set-key (kbd "C-i") 'yas-expand)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-continuous t)
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (quote
    ("~/git/oup-android-book/androidbook.org" "~/org/inbox.org" "~/org/gtd.org" "~/org/tickler.org")))
 '(package-selected-packages
   (quote
    (yankpad define-word ox-gfm exwm pfuture stickyfunc-enhance srefactor treemacs-projectile treemacs poet-theme mu4e-maildirs-extension mu4e-alert company-quickhelp company-emacs-eclim eclim org-mime json-reformat company intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode disaster company-c-headers cmake-mode clang-format noflet ensime sbt-mode scala-mode insert-shebang fish-mode company-shell auctex-latexmk org yapfify yaml-mode ws-butler winum web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package twittering-mode toml-mode toc-org tagedit spaceline powerline smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el pbcopy paradox spinner osx-trash osx-dictionary origami orgit org-ref pdf-tools key-chord ivy tablist org-present org-pomodoro alert log4e gntp org-download org-bullets open-junk-file nlinum-relative neotree move-text mmm-mode markdown-toc markdown-mode magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode link-hint less-css-mode launchctl json-snatcher js2-refactor multiple-cursors js-doc info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-bibtex parsebib helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh marshal logito pcache ht gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-rust seq flycheck-pos-tip pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight ess-smart-equals ess-R-data-view ctable ess julia-mode emmet-mode elisp-slime-nav dumb-jump diminish cython-mode company-web web-completion-data company-tern dash-functional tern company-auctex company-anaconda column-enforce-mode clean-aindent-mode cargo rust-mode bind-map bind-key biblio biblio-core auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile packed anaconda-mode pythonic ace-link ace-jump-helm-line helm helm-core ac-ispell auto-complete popup yasnippet which-key undo-tree org-plus-contrib nlinum json-mode js2-mode hydra graphviz-dot-mode evil-unimpaired csv-mode company-statistics coffee-mode auctex async aggressive-indent adaptive-wrap ace-window)))
 '(send-mail-function (quote mailclient-send-it))
 '(treemacs-git-mode (quote extended)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
