# version = "0.102.0"

let $abbrs = {
    'clr':  'clear --keep-scrollback'
    'e':    'explore --index'
    'ep':   'explore --index --peek'
    'c':    'cd'
    's':    'sudo'
    'b':    'bat'
    'px':   'chmod +x'
    'rf':   'rm -rf'
    'cr':   'cp -r'
    'mv':   'mv -i'
    'md':   'mkdir -v'
    'lns':  'ln -s'
    'dl':   'delta'
    'dls':  'delta -s'
    'pp':   'ping g.co'
    'mo':   'udisksctl mount -b'
    'umo':  'udisksctl unmount -b'
    'we':   'wezterm'
    'o':    'mimeopen'
    'r':    'ranger'
    'tm':   'tmux'
    'zj':   'zellij'
    'zja':  'zellij a --create'
    'v':    'nvim'
    'vd':   'nvim -d'
    'gi':   'git'
    'gg':   'lazygit'
    'qi':   $'git --git-dir=($env.HOME | path join .dot) --work-tree=($env.HOME)'
    'qq':   $'lazygit -g ($env.HOME | path join .dot) -w ($env.HOME)'
    'pj':   'pijul'

    'ctl':  'systemctl'
    'sctl': 'sudo systemctl'
    'yy':   'paru; fixkb'
    'ys':   'paru -S'
    'ycc':  'paru -Scc'
    'pa':   'paru'
    'p':    'parui'
    'pm':   'sudo pacman'
    'pms':  'sudo pacman -S'
    'pmr':  'sudo pacman -R'
    'pmrs': 'sudo pacman -Rs'
    'pmu':  'sudo pacman -U'
    'pmss': 'pacman -Ss'
    'pmsi': 'pacman -Si'
    'pmqs': 'pacman -Qs'
    'pmqi': 'pacman -Qi'
    'pmqm': 'pacman -Qm'
    'bt':   'bluetuith'

    'za':   'zathura'
    'lo':   'libreoffice'
    'ap':   'apack'
    'au':   'aunpack'
    'vt':   'clear --keep-scrollback; vitetris'
    'rh':   'runhaskell'
    'ca':   'cabal'
    'py':   'python'
    'pi':   'ipython'
    'pe':   'overlay use .venv/bin/activate.nu'
    'jl':   'julia'
    'fl':   'flutter'
    'ha':   'systemctl poweroff'
    're':   'systemctl reboot'
    'moz':  '/usr/lib/mozc/mozc_tool --mode=config_dialog'

    'po':   'polars'
} | transpose | rename abbreviation expansion

alias e  = explore --index
alias p  = parui
alias v  = nvim
alias gg = lazygit

let dark_theme = {
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'light_cyan' } else { 'light_gray' } }
    separator: black
    leading_trailing_space_bg: { bg: black }
    header: dark_gray
    empty: dark_gray
    bool: cyan
    int: yellow
    filesize: cyan
    duration: purple
    date: purple
    range: yellow
    float: yellow
    string: white
    nothing: dark_gray
    binary: purple
    cell-path: white
    row_index: dark_gray
    closure: { fg: dark_gray attr: i }
    record: { fg: dark_gray attr: i }
    list: { fg: dark_gray attr: i }
    block: { fg: dark_gray attr: i }
    glob: cyan
    hints: dark_gray
    search_result: { bg: yellow fg: black }
    shape_and: purple
    shape_binary: purple
    shape_block: dark_gray
    shape_bool: cyan
    shape_closure: dark_gray
    shape_custom: cyan
    shape_datetime: cyan
    shape_directory: cyan
    shape_external: blue
    shape_externalarg: cyan
    shape_external_resolved: { fg: blue attr: i }
    shape_filepath: cyan
    shape_flag: blue
    shape_float: { fg: yellow attr: i }
    shape_garbage: red
    shape_glob_interpolation: purple
    shape_globpattern: cyan
    shape_int: { fg: yellow attr: i }
    shape_internalcall: { fg: green attr: i }
    shape_keyword: green
    shape_list: dark_gray
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: dark_gray
    shape_operator: dark_gray
    shape_or: purple
    shape_pipe: dark_gray
    shape_range: yellow
    shape_record: dark_gray
    shape_redirection: dark_gray
    shape_signature: dark_gray
    shape_string: yellow
    shape_string_interpolation: yellow
    shape_table: dark_gray
    shape_variable: { fg: white attr: i }
    shape_vardecl: { fg: white attr: i }
    shape_raw_string: yellow
}

let carapace_completer = {|spans|
  # if the current command is an alias, get it's expansion
  let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)

  # overwrite
  let spans = (if $expanded_alias != null  {
    # put the first word of the expanded alias first in the span
    $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
  } else {
    $spans | skip 1 | prepend ($spans.0)
  })

  carapace $spans.0 nushell ...$spans
  | from json
}

# let fish_completer = {|spans|
#     fish --command $'complete "--do-complete=($spans | str join " ")"'
#     | $"value(char tab)description(char newline)" + $in
#     | from tsv --flexible --no-infer
# }
#
# let zoxide_completer = {|spans|
#     $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
# }
#
# let external_completer = {|spans|
#     let spans_orig = $spans
#
#     let spans_skip_sudo = if $spans.0 == sudo and ($spans | length) != 2 {
#         $spans | skip
#     } else {
#         $spans
#     }
#
#     let expanded_alias = scope aliases
#         | where name == $spans_skip_sudo.0
#         | get -i 0.expansion
#
#     let spans = if $expanded_alias != null {
#         $spans_skip_sudo
#         | skip 1
#         | prepend ($expanded_alias | split row ' ' | take 1)
#         #| append ''
#     } else {
#         $spans
#     }
#
#     #{ spans_orig: $spans_orig
#     #  spans_skip_sudo: $spans_skip_sudo
#     #  expanded_alias: $expanded_alias
#     #  spans: $spans
#     #} | to nuon | save -f ~/test/spans.nuon
#
#     match $spans.0 {
#         __zoxide_z => $zoxide_completer
#         #pacman     => $fish_completer
#         #systemctl  => $fish_completer
#         #git        => $fish_completer
#         # zellij     => $fish_completer
#         pijul      => $fish_completer
#         udisksctl  => $fish_completer
#         ghc        => $fish_completer
#         runhaskell => $fish_completer
#         cabal      => $fish_completer
#         _          => $carapace_completer
#     } | do $in $spans
# }

$env.config = {
    show_banner: false

    ls: {
        use_ls_colors: true
        clickable_links: true
    }

    rm: {
        always_trash: false # always act as if -t was given. Can be overridden with -p
    }

    table: {
        mode: compact # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
        index_mode: always # "always", "never", "auto" = show indexes when a table has "index" column
        show_empty: true # show 'empty list' and 'empty record' placeholders for command output
        padding: { left: 1, right: 1 } # a left right padding of each column in a table
        trim: {
            methodology: wrapping # wrapping or truncating
            wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
            truncating_suffix: "…" # A suffix used by the 'truncating' methodology
        }
        header_on_separator: false # show header text on separator/border line
        # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
    }

    error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages

    display_errors: {
        exit_code: false # assume the external command prints an error message
        # Core dump errors are always printed, and SIGPIPE never triggers an error.
        # The setting below controls message printing for termination by all other signals.
        termination_signal: true
    }

    # datetime_format determines what a datetime rendered in the shell would look like.
    # Behavior without this configuration point will be to "humanize" the datetime display,
    # showing something like "a day ago."
    datetime_format: {
        normal: '%A, %Y-%m-%d %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
        table: '%Y-%m-%d %H:%M:%S'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
    }

    explore: {
        status_bar_background: { fg: dark_gray, bg: black },
        command_bar_text: { fg: white },
        highlight: { bg: yellow },
        status: {
            error: { fg: white, bg: red },
            warn: {}
            info: {}
        },
        selected_cell: { fg: black, bg: light_blue },
    }

    history: {
        max_size: 100_000 # Session has to be reloaded for this to take effect
        sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
        file_format: "sqlite" # "sqlite" or "plaintext"
        isolation: true # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
    }

    completions: {
        case_sensitive: false # set to true to enable case-sensitive completions
        quick: true    # set this to false to prevent auto-selecting completions when only one remains
        partial: true    # set this to false to prevent partial filling of the prompt
        algorithm: "substring"    # prefix | fuzzy | substring
        sort: "smart" # "smart" (alphabetical for prefix matching, fuzzy score for fuzzy matching) or "alphabetical"
        external: {
            enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: $carapace_completer # check 'carapace_completer' above as an example
        }
        use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
    }

    filesize: {
        unit: metric
        precision: 1
    }

    cursor_shape: {
        emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
        vi_insert: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
        vi_normal: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
    }

    color_config: $dark_theme # if you want a more interesting theme, you can replace the empty record with `$dark_theme`, `$light_theme` or another custom record
    footer_mode: 20 # always, never, number_of_rows, auto
    float_precision: 2 # the precision for displaying floats in tables
    buffer_editor: null # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
    use_ansi_coloring: true
    bracketed_paste: true # enable bracketed paste, currently useless on windows
    edit_mode: vi # emacs, vi
    shell_integration: {
        # osc2 abbreviates the path if in the home_dir, sets the tab/window title, shows the running command in the tab/window title
        osc2: true
        # osc7 is a way to communicate the path to the terminal, this is helpful for spawning new tabs in the same directory
        osc7: true
        # osc8 is also implemented as the deprecated setting ls.show_clickable_links, it shows clickable links in ls output if your terminal supports it. show_clickable_links is deprecated in favor of osc8
        osc8: true
        # osc9_9 is from ConEmu and is starting to get wider support. It's similar to osc7 in that it communicates the path to the terminal
        osc9_9: false
        # osc133 is several escapes invented by Final Term which include the supported ones below.
        # 133;A - Mark prompt start
        # 133;B - Mark prompt end
        # 133;C - Mark pre-execution
        # 133;D;exit - Mark execution finished with exit code
        # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
        osc133: true
        # osc633 is closely related to osc133 but only exists in visual studio code (vscode) and supports their shell integration features
        # 633;A - Mark prompt start
        # 633;B - Mark prompt end
        # 633;C - Mark pre-execution
        # 633;D;exit - Mark execution finished with exit code
        # 633;E - Explicitly set the command line with an optional nonce
        # 633;P;Cwd=<path> - Mark the current working directory and communicate it to the terminal
        # and also helps with the run recent menu in vscode
        osc633: true
        # reset_application_mode is escape \x1b[?1l and was added to help ssh work better
        reset_application_mode: true
    }
    render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
    use_kitty_protocol: false # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
    highlight_resolved_externals: true # true enables highlighting of external commands in the repl resolved by which.
    recursion_limit: 50 # the maximum number of times nushell allows recursion before stopping it

    plugins: {} # Per-plugin configuration. See https://www.nushell.sh/contributor-book/plugins.html#configuration.

    plugin_gc: {
        # Configuration for plugin garbage collection
        default: {
            enabled: true # true to enable stopping of inactive plugins
            stop_after: 10sec # how long to wait after a plugin is inactive to stop it
        }
        plugins: {
            # alternate configuration for specific plugins, by name, for example:
            #
            # gstat: {
            #     enabled: false
            # }
        }
    }

    hooks: {
        pre_prompt: [{ null }] # run before the prompt is shown
        pre_execution: [{ null }] # run before the repl input is run
        env_change: {
            PWD: [{|before, after| null }] # run if the PWD environment is different since the last repl input
        }
        display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
        command_not_found: { null } # return an error message when a command is not found
    }

    menus: [
        # Configuration for default nushell menus
        # Note the lack of source parameter
        {
            name: completion_menu
            only_buffer_difference: false
            marker: $"(ansi -e { fg: black,   bg: blue }) | (ansi reset) " # "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: default
                selected_text: { attr: r }
                description_text: yellow
                match_text: { attr: u }
                selected_match_text: { attr: ur }
            }
        }
        {
            name: ide_completion_menu
            only_buffer_difference: false
            marker: $"(ansi -e { fg: black bg: blue }) | (ansi reset) " # "| "
            type: {
                layout: ide
                min_completion_width: 8
                max_completion_width: 80
                max_completion_height: 80
                padding: 0
                border: false
                cursor_offset: 0
                description_mode: "prefer_right"
                min_description_width: 0
                max_description_width: 80
                max_description_height: 10
                description_offset: 1
                correct_cursor_pos: true
            }
            style: {
                text: { fg: blue }
                selected_text: { attr: r }
                description_text: yellow
                match_text: { fg: dark_gray }
                selected_match_text: { fg: dark_gray attr: r }
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: list
                page_size: 20
            }
            style: {
                text: default
                selected_text: default_reverse
                description_text: yellow
            }
        }
        {
            name: help_menu
            only_buffer_difference: true
            marker: $"(ansi -e { fg: black bg: blue }) ? (ansi reset) " # "| "
            type: {
                layout: description
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: alias_menu
            only_buffer_difference: false
            marker: $"(ansi -e { fg: black bg: blue }) | (ansi reset) "
            type: {
                layout: ide
                min_completion_width: 0
                max_completion_width: 80
                max_completion_height: 80
                padding: 0
                border: false
                cursor_offset: 0
                description_mode: "prefer_right"
                min_description_width: 0
                max_description_width: 50
                max_description_height: 10
                description_offset: 1
                correct_cursor_pos: true
            }
            style: {
                text: { fg: blue attr: i }
                selected_text: { fg: black bg: blue }
                description_text: yellow
                match_text: {}
                selected_match_text: { fg: black bg: blue }
            }
            source: { |buffer, position|
                scope aliases
                | where name == $buffer
                | each {|it| { value: $it.expansion } }
            }
        }
        {
            name: abbr_menu
            only_buffer_difference: false
            marker: $"(ansi -e { fg: black,   bg: blue }) | (ansi reset) "
            type: {
                layout: ide
                min_completion_width: 0
                max_completion_width: 80
                max_completion_height: 80
                padding: 0
                border: false
                cursor_offset: 0
                description_mode: "prefer_right"
                min_description_width: 0
                max_description_width: 50
                max_description_height: 10
                description_offset: 1
                correct_cursor_pos: true
            }
            style: {
                text: { fg: blue attr: i }
                selected_text: { fg: black bg: blue }
                description_text: yellow
                match_text: {}
                selected_match_text: { fg: black bg: blue }
            }
            source: {|buffer, position|
                let segs = $buffer | split row -r '\s+'
                let segs_dropped = $segs | drop
                let last_seg = $segs | last

                #let match = scope aliases | where name == $buffer
                let match = $abbrs | where abbreviation == $last_seg

                if ($match | is-not-empty) {
                  # { value: $match.expansion.0 }
                  { value: ($segs_dropped | append $match.expansion.0 | str join ' ') }
                } else {
                  { value: $buffer }
                }
            }
        }
    ]

    keybindings: [
        #{
        #    name: fuzzy_dir
        #    modifier: control
        #    keycode: char_f
        #    mode: [emacs, vi_normal, vi_insert]
        #    event: {
        #        send: executehostcommand
        #        cmd: "commandline edit --append (
        #            ls **/*
        #            | where type == dir
        #            | get name
        #            | input list --fuzzy
        #                $'Please choose a (ansi magenta)directory(ansi reset) to (ansi cyan_underline)insert(ansi reset):'
        #        )"
        #    }
        #}
        {
            name: abbr_menu
            modifier: control
            keycode: char_j
            mode: [emacs, vi_insert]
            event: [
                { send: menu name: abbr_menu }
                { send: enter }
            ]
        }
        {
            name: abbr_menu
            modifier: none
            keycode: space
            mode: [emacs, vi_insert]
            event: [
                { send: menu name: abbr_menu }
                { edit: insertchar value: ' ' }
            ]
        }
        {
            name: alias_menu
            modifier: control
            keycode: space
            mode: [vi_normal, vi_insert]
            event: [
                { send: menu name: alias_menu }
                { edit: insertchar, value: ' ' }
            ]
        }
        {
            name: ide_completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: ide_completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: [emacs, vi_insert]
            # event: { send: menu name: history_menu }
            event: {
                send: ExecuteHostCommand
                cmd:
                    "commandline edit (
                        history
                        | uniq-by command
                        | reverse
                        | each {|it|
                            [ (ansi dark_gray)
                              ($it.start_timestamp | format date '%Y-%m-%d %H:%M:%S')
                              '  '
                              (ansi reset)
                              $it.command
                            ] | str join ''
                          }
                        | str join (char -i 0)
                        | fzf --scheme=history --ansi --read0 --layout=reverse --height=40% --prompt=' ' -q (commandline)
                        | decode utf-8
                        | str trim
                        | parse '{date}  {command}'
                        | do {
                              let inp = $in
                              if ($inp | is-not-empty) {
                                  $inp
                                  | get -i command.0
                                  | default ''
                              } else {
                                  ''
                              }
                          }
                    )"
            }
        }
        {
            name: prepend_sudo
            modifier: control
            keycode: char_s
            mode: [emacs, vi_insert]
            event: {
                send: ExecuteHostCommand
                cmd:
                    "commandline set-cursor 0;
                    commandline edit -i 'sudo ';
                    commandline set-cursor -e"
            }
        }
        {
            name: completion_menu
            modifier: control
            keycode: char_n
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        # {
        #     name: history_menu
        #     modifier: control
        #     keycode: char_r
        #     mode: [emacs, vi_insert, vi_normal]
        #     event: { send: menu name: history_menu }
        # }
        {
            name: help_menu
            modifier: none
            keycode: f1
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: help_menu }
        }
        {
            name: completion_previous_menu
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menuprevious }
        }
        {
            name: next_page_menu
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page_menu
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
        {
            name: escape
            modifier: none
            keycode: escape
            mode: [emacs, vi_normal, vi_insert]
            event: { send: esc }    # NOTE: does not appear to work
        }
        {
            name: escape
            modifier: control
            keycode: 'char_['
            mode: [emacs, vi_normal, vi_insert]
            event: { send: esc }    # NOTE: does not appear to work
        }
        {
            name: cancel_command
            modifier: control
            keycode: char_c
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrlc }
        }
        {
            name: quit_shell
            modifier: control
            keycode: char_d
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrld }
        }
        {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
        {
            name: search_history
            modifier: control
            keycode: char_q
            mode: [emacs, vi_normal, vi_insert]
            event: { send: searchhistory }
        }
        {
            name: open_command_editor
            modifier: control
            keycode: char_o
            mode: [emacs, vi_normal, vi_insert]
            event: { send: openeditor }
        }
        {
            name: move_up
            modifier: none
            keycode: up
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: none
            keycode: down
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: move_left
            modifier: none
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuleft }
                    { send: left }
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: none
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: control
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: control
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: none
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: char_a
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: none
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: control
            keycode: char_e
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end
            modifier: control
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolineend }
        }
        {
            name: move_up
            modifier: control
            keycode: char_p
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: control
            keycode: char_t
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: delete_one_character_backward
            modifier: none
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspace }
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: delete_one_character_forward
            modifier: none
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: 'char_,'
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: delete_one_character_backward
            modifier: control
            keycode: char_h
            mode: [emacs, vi_insert]
            event: { edit: backspace }
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: char_w
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: move_left
            modifier: none
            keycode: backspace
            mode: vi_normal
            event: { edit: moveleft }
        }
        {
            name: newline_or_run_command
            modifier: none
            keycode: enter
            mode: emacs
            event: { send: enter }
        }
        {
            name: move_left
            modifier: control
            keycode: char_b
            mode: emacs
            event: {
                until: [
                    { send: menuleft }
                    { send: left }
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: control
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }
        {
            name: redo_change
            modifier: control
            keycode: char_r
            mode: [vi_normal]
            event: {edit: redo}
        }
        {
            name: redo_change
            modifier: control
            keycode: char_g
            mode: emacs
            event: { edit: redo }
        }
        {
            name: undo_change
            modifier: control
            keycode: char_z
            mode: emacs
            event: { edit: undo }
        }
        {
            name: paste_before
            modifier: control
            keycode: char_y
            mode: emacs
            event: { edit: pastecutbufferbefore }
        }
        {
            name: cut_word_left
            modifier: control
            keycode: char_w
            mode: emacs
            event: { edit: cutwordleft }
        }
        {
            name: cut_line_to_end
            modifier: control
            keycode: char_k
            mode: emacs
            event: { edit: cuttoend }
        }
        {
            name: cut_line_from_start
            modifier: control
            keycode: char_u
            mode: [emacs, vi_insert]
            event: { edit: cutfromstart }
        }
        {
            name: swap_graphemes
            modifier: control
            keycode: char_t
            mode: emacs
            event: { edit: swapgraphemes }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: left
            mode: emacs
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: right
            mode: emacs
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: char_b
            mode: emacs
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: delete_one_word_forward
            modifier: alt
            keycode: delete
            mode: emacs
            event: { edit: deleteword }
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: backspace
            mode: emacs
            event: { edit: backspaceword }
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: char_m
            mode: emacs
            event: { edit: backspaceword }
        }
        {
            name: cut_word_to_right
            modifier: alt
            keycode: char_d
            mode: emacs
            event: { edit: cutwordright }
        }
        {
            name: upper_case_word
            modifier: alt
            keycode: char_u
            mode: emacs
            event: { edit: uppercaseword }
        }
        {
            name: lower_case_word
            modifier: alt
            keycode: char_l
            mode: emacs
            event: { edit: lowercaseword }
        }
        {
            name: capitalize_char
            modifier: alt
            keycode: char_c
            mode: emacs
            event: { edit: capitalizechar }
        }
        # The following bindings with `*system` events require that Nushell has
        # been compiled with the `system-clipboard` feature.
        # This should be the case for Windows, macOS, and most Linux distributions
        # Not available for example on Android (termux)
        # If you want to use the system clipboard for visual selection or to
        # paste directly, uncomment the respective lines and replace the version
        # using the internal clipboard.
        {
            name: copy_selection
            modifier: control_shift
            keycode: char_c
            mode: emacs
            event: { edit: copyselection }
            # event: { edit: copyselectionsystem }
        }
        {
            name: cut_selection
            modifier: control_shift
            keycode: char_x
            mode: emacs
            event: { edit: cutselection }
            # event: { edit: cutselectionsystem }
        }
        # {
        #     name: paste_system
        #     modifier: control_shift
        #     keycode: char_v
        #     mode: emacs
        #     event: { edit: pastesystem }
        # }
        {
            name: select_all
            modifier: control_shift
            keycode: char_a
            mode: emacs
            event: { edit: selectall }
        }
        {
            name: paste
            modifier: control_shift
            keycode: char_v
            mode: emacs
            event: { edit: pastecutbufferbefore }
        }
    ]
}

def --env cl [bl: closure] {
    let inp = $in
    clear --keep-scrollback
    $inp | do $bl
}

def --env cla [bl: closure] {
    $in | do $bl
    clear --keep-scrollback
}

def --env d [] {
    cd
    clear --keep-scrollback
}

def --env mdc [dir: path] {
    mkdir -v $dir
    cd $dir
}

def --env k [] {
  cd (walk --icons)
}

def l   [dir: path = "."] { ls     $dir | sort-by type name }
def la  [dir: path = "."] { ls -a  $dir | sort-by type name }
def ll  [dir: path = "."] { ls -l  $dir | sort-by type name }
def lla [dir: path = "."] { ls -la $dir | sort-by type name }

def dh [] {
  df -h
  | str replace "Mounted on" "mounted_on"
  | from ssv -m 1
  | rename --block { str downcase }
  | into filesize size
  | into filesize used
  | into filesize avail
  | update use% { parse '{x}%' | get x.0 | into int }
  | sort-by filesystem
}

def lsblk [] {
  jc lsblk
  | from json
  | into filesize size
}

def clip [] {
  ^xclip -selection clipboard
}

def 'nu-complete nop' [] { [] }

def 'nu-complete m' [] {
  do $carapace_completer [ssh '']
}

def m [host: string@'nu-complete m', session: string@'nu-complete nop' = 'v'] {
  mosh $host -- tmux -u new -As $session
}

def icams [] {
  cd ~/.local/opt/openvpn/icams
  sudo openvpn icams.ovpn
}

def cmp [] {
  cd ~/p/hs/cmpimg
  cabal run cmpimg -- rating.db
}

def 'polars duplicates-by' [select_expr] {
  let df = $in
  let mask = $df | polars select $select_expr | polars is-duplicated

  $df | polars filter-with $mask
}

source ($NU_PLUGIN_DIRS | path join zoxide.nu)
source ($NU_PLUGIN_DIRS | path join atuin.nu)

def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    z $cwd
  }
  rm -fp $tmp
}

use atuin-completions.nu *
use uv-completions.nu *
use custom-completions/zellij/zellij-completions.nu *
