# Nushell Environment Config File
#
# version = "0.98"

def create_left_prompt [] {
    # [(ansi -e { fg: blue, bg: reset }) ''] | str join
}

def create_right_prompt [] {
    let home = $nu.home-path

    let dir = ([
        ($env.PWD | str substring 0..<($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let color = ansi -e { fg: black, bg: blue }
    let path_color = (if (is-admin) { ansi red } else { $color })
    let separator_color = (if (is-admin) { ansi light_red } else { ansi black })
    let path_segment = $"($path_color) ($dir)"
    let path = $" ($path_segment) " | str replace --all (char path_sep) $"($separator_color)/($path_color)"

    let git_status = do { git status --porcelain } | complete
    let git = if ($git_status.exit_code == 0) {([
        (ansi -e { fg: blue })
        (char space)
        (git branch --show-current | str trim)
    ] | str join)
    }

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi -e { fg: black, bg: red})
        (char space)
        ($env.LAST_EXIT_CODE)
        (char space)
        (ansi reset)
    ] | str join)
    } else { "" }

    ([$last_exit_code, $git, $path] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| }

let prompt_insert  = ansi -e { fg: black,   bg: blue }
let prompt_normal  = ansi -e { fg: black,   bg: cyan }
let trans_normal   = ansi -e { fg: blue,    bg: default }
$env.PROMPT_INDICATOR = {|| " ⟩ " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| $"($prompt_insert) ⟩ (ansi reset) " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"($prompt_normal) ⟩ (ansi reset) " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

$env.TRANSIENT_PROMPT_COMMAND = {|| create_left_prompt }
$env.TRANSIENT_PROMPT_INDICATOR = {|| " ⟩ " }
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| $"($trans_normal)(do $env.PROMPT_COMMAND) ⟩  (ansi reset)" }
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| $"($trans_normal)(do $env.PROMPT_COMMAND) ⟩  (ansi reset)" }
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "::: " }
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| $"($trans_normal)(create_right_prompt | ansi strip)(ansi reset)" }

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
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

$env.SHELL = 'nu'
