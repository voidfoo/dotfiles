;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion
      :variables
      auto-completion-enable-help-tooltip t
      auto-completion-enable-snippets-in-popup t
      auto-completion-enable-sort-by-usage t)

     ;; better-defaults
     ;; csharp

     (clojure
      :variables
      clojure-backend 'cider
      clojure-enable-clj-refactor t
      clojure-enable-fancify-symbols t
      clojure-enable-linters '(clj-kondo joker))
     dap
     docker

     emacs-lisp

     ;; emoji

     ibuffer

     (git
      :variables
      magit-log-section-commit-count 20
      ;;git-magit-status-fullscreen t
      ;;git-enable-github-support t
      )

     helm

     (javascript
      :variables
      javascript-backend 'tide
      javascript-lsp-linter nil
      javascript-fmt-tool 'prettier
      javascript-repl 'nodejs)

     (lsp :variables
          lsp-rust-server 'rust-analyzer
          lsp-rust-analyzer-server-display-inlay-hints t)
     markdown
     ;; multiple-cursors

     mu4e

     org
     ;; react
     restclient
     (rust :variables
           rust-format-on-save t)
     search-engine
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     treemacs

     (typescript
      :variables
      typescript-indent-level 2
      js-indent-level 2
      tide-format-options
      '(
        :tabSize 2
        :convertTabsToSpaces t
        :insertSpaceAfterFunctionKeywordForAnonymousFunctions nil
        :placeOpenBraceOnNewLineForFunctions nil
        :indentSize 2
        :insertSpaceBeforeFunctionParenthesis nil))

     ;; version-control
     w3m
     yaml
     zig
     )



   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      edit-indirect
                                      leuven-theme
                                      vterm
                                      atomic-chrome
                                      emojify
                                      (majutsu
                                       :location (recipe
                                                  :fetcher github
                                                  :repo "0WD0/majutsu"
                                                  ))
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 15)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(leuven
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'all-the-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols 'display-graphic-p

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `ack' and `grep'.
   ;; (default '("rg" "ag" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-redo', `undo-fu' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system from or to undo-tree. (default `undo-redo')"
   dotspacemacs-undo-system 'undo-redo

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun my/server-ensure-safe-dir (dir)
  "Make sure DIR is a directory with no race-condition issues.
Creates the directory if necessary and makes sure:
- there's no symlink involved
- it's owned by us
- it's not readable/writable by anybody else."
  (setq dir (directory-file-name dir))
  (let ((attrs (file-attributes dir 'integer)))
    (unless attrs
      (cl-letf (((default-file-modes) ?\700)) (make-directory dir t))
      (setq attrs (file-attributes dir 'integer)))

    ;; Check that it's safe for use.
    (let* ((uid (nth 2 attrs))
           (w32 (eq system-type 'windows-nt))
           (unsafe (cond
                    ((not (eq t (car attrs)))
                     (if (null attrs) "its attributes can't be checked"
                       (format "it is a %s"
                               (if (stringp (car attrs))
                                   "symlink" "file"))))
                    ((and w32 (zerop uid)) ; on FAT32?
                     (display-warning
                      'server
                      (format-message "\
Using `%s' to store Emacs-server authentication files.
Directories on FAT32 filesystems are NOT secure against tampering.
See variable `server-auth-dir' for details."
                                      (file-name-as-directory dir))
                      :warning)
                     nil)
                    ((and (/= uid (user-uid)) ; is the dir ours?
                          (or (not w32)
                              ;; Files created on Windows by Administrator
                              ;; (RID=500) have the Administrators (RID=544)
                              ;; group recorded as the owner.
                              (/= uid 544) (/= (user-uid) 500)))
                     (format "it is not owned by you (owner = %s (%d))"
                             (user-full-name uid) uid))
                    (w32 nil)           ; on NTFS?
                    ((/= 0 (logand ?\077 (file-modes dir)))
                     (format "it is accessible by others (%03o)"
                             (file-modes dir)))
                    (t nil))))
      (when unsafe
        (message "`%s' is not a safe directory because %s"
                 (expand-file-name dir) unsafe)))))

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (setq fill-column 78)
  (setq-default indent-tabs-mode nil)
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))
  (setq-default show-trailing-whitespace t)
  (global-visual-line-mode)
  (server-start)
  (atomic-chrome-start-server)
  (setq atomic-chrome-default-major-mode 'markdown-mode)
  (setq atomic-chrome-url-major-mode-alist
        '(("github\\.com" . gfm-mode)))
  (setq atomic-chrome-buffer-open-style 'frame)
  (add-to-list 'auto-mode-alist '("stack\\(exchange\\|overflow\\)\\.com\\.[a-z0-9]+\\.txt" . markdown-mode))
  (add-to-list 'auto-mode-alist '("github\\.com\\.[a-z0-9]+\\.txt" . markdown-mode))

  ;; (require 'helm-bookmark)
                                        ;(pdftools-install)
  ;; specify font for all unicode characters
  (when (member "Noto Color Emoji" (font-family-list))
    (set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend))
  (when (member "Symbols Nerd Font Mono" (font-family-list))
    (set-fontset-font t 'unicode "Symbols Nerd Font Mono" nil 'prepend))
  ;; avoid split vertically
  (setq split-height-threshold 200)
  (setq split-width-threshold 160)
  (setq winum-scope 'frame-local)
  (setq markdown-fontify-code-blocks-natively t)
  (setq spacemacs-useless-buffers-regexp '("magit-.*: .*"))
  (setq normal-erase-is-backspace t)

  (setq git-link-default-remote "upstream"
        git-link-default-branch "main")

  ;; use mu4e for e-mail in emacs
  (setq mail-user-agent 'mu4e-user-agent)

  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
  (setq mu4e-trash-folder  "/[Gmail].Trash")

  ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)

  (setq mu4e-maildir-shortcuts
        '( (:maildir "/INBOX"              :key ?i)
           (:maildir "/Primary"            :key ?P)
           (:maildir "/[Gmail].Important"  :key ?p)
           (:maildir "/[Gmail].Sent Mail"  :key ?s)
           (:maildir "/[Gmail].Trash"      :key ?t)
           (:maildir "/[Gmail].All Mail"   :key ?a)))

  ;; (add-to-list 'mu4e-bookmarks
  ;;              ;; ':favorite t' i.e, use this one for the modeline
  ;;              '(:query "maildir:/inbox" :name "Inbox" :key ?i :favorite t))

  ;; allow for updating mail using 'U' in the main view:
  (setq mu4e-get-mail-command "offlineimap")

  ;; something about ourselves
  (setq
   user-mail-address "void.foo@gmail.com"
   user-full-name  "Voi dFoo"
   mu4e-compose-signature
   (concat
    "Voi dFoo\n"
    "\n")
   send-mail-function 'smtpmail-send-it
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-smtp-service 587
   )

  ;; (advice-add 'server-ensure-safe-dir :override #'my/server-ensure-safe-dir)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" default)))
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (twittering-mode ghub let-alist pdf-tools atomic-chrome websocket logito docker tablist docker-tramp editorconfig yaml-mode shut-up parent-mode pkg-info epl gitignore-mode flx goto-chg diminish winum fuzzy json-snatcher json-reformat zenburn-theme csv-mode spinner haml-mode bind-key powerline org alert flycheck markdown-mode multiple-cursors hydra iedit csharp-mode dash-functional tern yasnippet packed auto-complete company highlight anzu smartparens bind-map evil undo-tree gh magit request helm helm-core popup avy s pcache projectile js2-mode uuidgen pug-mode org-projectile org-download ob-http livid-mode skewer-mode simple-httpd link-hint hide-comnt github-search magit-popup git-commit with-editor dash async marshal ht flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump f column-enforce-mode xkcd ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package toc-org tagedit spacemacs-theme spaceline smooth-scrolling smeargle slim-mode scss-mode sass-mode restclient restart-emacs rainbow-delimiters quelpa powershell popwin persp-mode pcre2el paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omnisharp neotree move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode ibuffer-projectile hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu engine-mode emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dockerfile-mode define-word company-web company-tern company-statistics company-quickhelp company-emoji coffee-mode clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(connection-local-criteria-alist
     '(((:application tramp :protocol "flatpak")
        tramp-flatpak-connection-local-default-profile)
       ((:application tramp :protocol "kubernetes")
        tramp-kubernetes-connection-local-default-profile)
       ((:application eshell) eshell-connection-default-profile)
       ((:application tramp) tramp-connection-local-default-system-profile
        tramp-connection-local-default-shell-profile)))
   '(connection-local-profile-alist
     '((tramp-flatpak-connection-local-default-profile
        (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin"
                           "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin"
                           "/local/bin" "/local/freeware/bin" "/local/gnu/bin"
                           "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin"
                           "/opt/bin" "/opt/sbin" "/opt/local/bin"))
       (tramp-kubernetes-connection-local-default-profile
        (tramp-config-check . tramp-kubernetes--current-context-data)
        (tramp-extra-expand-args 97
                                 (tramp-kubernetes--container
                                  (car tramp-current-connection))
                                 104
                                 (tramp-kubernetes--pod
                                  (car tramp-current-connection))
                                 120
                                 (tramp-kubernetes--context-namespace
                                  (car tramp-current-connection))))
       (eshell-connection-default-profile (eshell-path-env-list))
       (tramp-connection-local-darwin-ps-profile
        (tramp-process-attributes-ps-args "-acxww" "-o"
                                          "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                          "-o" "state=abcde" "-o"
                                          "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
        (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                            (user . string) (egid . number)
                                            (comm . 52) (state . 5)
                                            (ppid . number) (pgrp . number)
                                            (sess . number) (ttname . string)
                                            (tpgid . number) (minflt . number)
                                            (majflt . number)
                                            (time . tramp-ps-time) (pri . number)
                                            (nice . number) (vsize . number)
                                            (rss . number) (etime . tramp-ps-time)
                                            (pcpu . number) (pmem . number) (args)))
       (tramp-connection-local-busybox-ps-profile
        (tramp-process-attributes-ps-args "-o"
                                          "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                          "-o" "stat=abcde" "-o"
                                          "ppid,pgid,tty,time,nice,etime,args")
        (tramp-process-attributes-ps-format (pid . number) (user . string)
                                            (group . string) (comm . 52)
                                            (state . 5) (ppid . number)
                                            (pgrp . number) (ttname . string)
                                            (time . tramp-ps-time) (nice . number)
                                            (etime . tramp-ps-time) (args)))
       (tramp-connection-local-bsd-ps-profile
        (tramp-process-attributes-ps-args "-acxww" "-o"
                                          "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                          "-o"
                                          "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
        (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                            (user . string) (egid . number)
                                            (group . string) (comm . 52)
                                            (state . string) (ppid . number)
                                            (pgrp . number) (sess . number)
                                            (ttname . string) (tpgid . number)
                                            (minflt . number) (majflt . number)
                                            (time . tramp-ps-time) (pri . number)
                                            (nice . number) (vsize . number)
                                            (rss . number) (etime . number)
                                            (pcpu . number) (pmem . number) (args)))
       (tramp-connection-local-default-shell-profile (shell-file-name . "/bin/sh")
                                                     (shell-command-switch . "-c"))
       (tramp-connection-local-default-system-profile (path-separator . ":")
                                                      (null-device . "/dev/null")
                                                      (exec-suffixes ""))))
   '(custom-safe-themes
     '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476"
       "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" default))
   '(evil-want-Y-yank-to-eol t)
   '(package-selected-packages
     '(ac-ispell ace-jump-helm-line ace-link ace-window adaptive-wrap
                 aggressive-indent alert anzu async atomic-chrome auto-compile
                 auto-complete auto-dictionary auto-highlight-symbol
                 auto-yasnippet avy bind-key bind-map bracketed-paste buffer-move
                 clean-aindent-mode coffee-mode column-enforce-mode company
                 company-emoji company-quickhelp company-statistics company-tern
                 company-web csharp-mode csv-mode dash dash-functional define-word
                 diminish docker docker-tramp dockerfile-mode dumb-jump
                 editorconfig elisp-slime-nav emmet-mode emoji-cheat-sheet-plus
                 engine-mode epl eval-sexp-fu evil evil-anzu evil-args evil-ediff
                 evil-escape evil-exchange evil-iedit-state evil-indent-plus
                 evil-lisp-state evil-magit evil-matchit evil-mc
                 evil-nerd-commenter evil-numbers evil-search-highlight-persist
                 evil-surround evil-tutor evil-unimpaired evil-visual-mark-mode
                 evil-visualstar exec-path-from-shell expand-region eyebrowse f
                 fancy-battery fill-column-indicator flx flx-ido flycheck
                 flyspell-correct flyspell-correct-helm fuzzy gh gh-md ghub gist
                 git-commit git-link git-messenger git-timemachine
                 gitattributes-mode gitconfig-mode github-browse-file github-clone
                 github-search gitignore-mode gnuplot golden-ratio
                 google-translate goto-chg haml-mode helm helm-ag helm-c-yasnippet
                 helm-company helm-core helm-css-scss helm-descbinds helm-flx
                 helm-flyspell helm-gitignore helm-make helm-mode-manager
                 helm-projectile helm-swoop helm-themes helm-w3m help-fns+
                 hide-comnt highlight highlight-indentation highlight-numbers
                 highlight-parentheses hl-todo ht htmlize hungry-delete hydra
                 ibuffer-projectile ido-vertical-mode iedit indent-guide info+
                 jade-mode js-doc js2-mode js2-refactor json-mode json-reformat
                 json-snatcher less-css-mode let-alist leuven-theme link-hint
                 linum-relative livid-mode logito lorem-ipsum macrostep magit
                 magit-gh-pulls magit-gitflow magit-popup markdown-mode
                 markdown-toc marshal mmm-mode move-text multiple-cursors neotree
                 ob-http omnisharp open-junk-file org org-bullets org-download
                 org-plus-contrib org-pomodoro org-present org-projectile
                 org-repo-todo orgit packed page-break-lines paradox parent-mode
                 pcache pcre2el pdf-tools persp-mode pkg-info popup popwin
                 powerline powershell projectile pug-mode quelpa
                 rainbow-delimiters request restart-emacs restclient s sass-mode
                 scss-mode shut-up simple-httpd skewer-mode slim-mode smartparens
                 smeargle smooth-scrolling spaceline spacemacs-theme spinner
                 tablist tagedit tern toc-org twittering-mode undo-tree
                 use-package uuidgen vi-tilde-fringe volatile-highlights w3m
                 web-beautify web-mode websocket which-key window-numbering winum
                 with-editor ws-butler xkcd yaml-mode yasnippet zenburn-theme))
   '(paradox-github-token t))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
