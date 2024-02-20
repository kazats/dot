# Nushell Environment Config File
#
# version = "0.90.1"

def create_left_prompt [] {
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    # let time_segment = ([
    #     (ansi reset)
    #     (ansi magenta)
    #     (date now | format date '%x %X %p') # try to respect user's locale
    # ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
    #     str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let home =  $nu.home-path

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let color = ansi -e { fg: black, bg: blue }
    let path_color = (if (is-admin) { ansi red } else { $color })
    let separator_color = (if (is-admin) { ansi light_red } else { ansi black })
    let path_segment = $"($path_color) ($dir)"
    let path = $"($path_segment) " | str replace --all (char path_sep) $"($separator_color)/($path_color)"

    let git_status = do { git status --porcelain } | complete
    let git = if ($git_status.exit_code == 0) {([
        (ansi -e { fg: blue, bg: black })
        (char space)
        (git branch --show-current | str trim)
        (char space)
    ] | str join)
    }

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi red)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $git, $path] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| }

let prompt_insert  = ansi -e { fg: black,   bg: blue }
let prompt_normal  = ansi -e { fg: black,   bg: cyan }
let trans_normal   = ansi -e { fg: blue,    bg: default }
# let transient_prompt_insert = ansi -e { fg: blue, bg: default }
$env.PROMPT_INDICATOR = {|| " ⟩ " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| $"($prompt_insert) ⟩ (ansi reset) " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"($prompt_normal) ⟩ (ansi reset) " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| create_left_prompt }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| " ⟩ " }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| $"($trans_normal) ⟩ (ansi reset)" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| $"($trans_normal) ⟩ (ansi reset)" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "::: " }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| $"($trans_normal)(create_right_prompt)(ansi reset)" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

