complete -c pijul -n "__fish_use_subcommand" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_use_subcommand" -s V -l version -d 'Print version information'
complete -c pijul -n "__fish_use_subcommand" -f -a "init" -d 'Initializes an empty pijul repository'
complete -c pijul -n "__fish_use_subcommand" -f -a "clone" -d 'Clones an existing pijul repository'
complete -c pijul -n "__fish_use_subcommand" -f -a "record" -d 'Creates a new change'
complete -c pijul -n "__fish_use_subcommand" -f -a "diff" -d 'Shows difference between two channels/changes'
complete -c pijul -n "__fish_use_subcommand" -f -a "log" -d 'Show the entire log of changes'
complete -c pijul -n "__fish_use_subcommand" -f -a "push" -d 'Pushes changes to a remote upstream'
complete -c pijul -n "__fish_use_subcommand" -f -a "pull" -d 'Pulls changes from a remote upstream'
complete -c pijul -n "__fish_use_subcommand" -f -a "change" -d 'Shows information about a particular change'
complete -c pijul -n "__fish_use_subcommand" -f -a "dependents" -d 'Lists the transitive closure of the reverse dependency relation'
complete -c pijul -n "__fish_use_subcommand" -f -a "channel" -d 'Manages different channels'
complete -c pijul -n "__fish_use_subcommand" -f -a "protocol" -d 'This command is not meant to be run by the user, instead it is called over SSH'
complete -c pijul -n "__fish_use_subcommand" -f -a "git" -d 'Imports a git repository into pijul'
complete -c pijul -n "__fish_use_subcommand" -f -a "move" -d 'Moves a file in the working copy and the tree'
complete -c pijul -n "__fish_use_subcommand" -f -a "list" -d 'Lists files tracked by pijul'
complete -c pijul -n "__fish_use_subcommand" -f -a "add" -d 'Adds a path to the tree'
complete -c pijul -n "__fish_use_subcommand" -f -a "remove" -d 'Removes a file from the tree of tracked files (`pijul record` will then record this as a deletion)'
complete -c pijul -n "__fish_use_subcommand" -f -a "reset" -d 'Resets the working copy to the last recorded change'
complete -c pijul -n "__fish_use_subcommand" -f -a "debug"
complete -c pijul -n "__fish_use_subcommand" -f -a "fork" -d 'Create a new channel'
complete -c pijul -n "__fish_use_subcommand" -f -a "unrecord" -d 'Unrecords a list of changes'
complete -c pijul -n "__fish_use_subcommand" -f -a "apply" -d 'Applies changes to a channel'
complete -c pijul -n "__fish_use_subcommand" -f -a "remote" -d 'Manages remote repositories'
complete -c pijul -n "__fish_use_subcommand" -f -a "archive" -d 'Creates an archive of the repository'
complete -c pijul -n "__fish_use_subcommand" -f -a "credit" -d 'Shows which change last affected each line of the given file(s)'
complete -c pijul -n "__fish_use_subcommand" -f -a "tag" -d 'Manage tags (create tags, check out a tag)'
complete -c pijul -n "__fish_use_subcommand" -f -a "identity" -d 'A collection of tools for interactively managing the user\'s identities. This may be useful if you use Pijul in multiple contexts, for example both work & personal projects'
complete -c pijul -n "__fish_use_subcommand" -f -a "client" -d 'Authenticates with a HTTP server'
complete -c pijul -n "__fish_use_subcommand" -f -a "completion" -d 'Shell completion script generation'
complete -c pijul -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_seen_subcommand_from init" -l channel -d 'Set the name of the current channel (defaults to "main")' -r
complete -c pijul -n "__fish_seen_subcommand_from init" -s k -l kind -d 'Project kind; if Pijul knows about your project kind, the .ignore file will be populated with a conservative list of commonly ignored entries. Example: `pijul init --kind=rust`' -r
complete -c pijul -n "__fish_seen_subcommand_from init" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from clone" -l channel -d 'Set the remote channel' -r
complete -c pijul -n "__fish_seen_subcommand_from clone" -l change -d 'Clone this change and its dependencies' -r
complete -c pijul -n "__fish_seen_subcommand_from clone" -l state -d 'Clone this state' -r
complete -c pijul -n "__fish_seen_subcommand_from clone" -l path -d 'Clone this path only' -r
complete -c pijul -n "__fish_seen_subcommand_from clone" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_seen_subcommand_from clone" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from record" -s m -l message -d 'Set the change message' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l description -d 'Set the description field' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l author -d 'Set the author field' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l channel -d 'Record the change in this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l timestamp -d 'Set the timestamp field' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l working-copy -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l amend -d 'Amend this change instead of creating a new change' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -l identity -d 'Identity to sign changes with' -r
complete -c pijul -n "__fish_seen_subcommand_from record" -s a -l all -d 'Record all paths that have changed'
complete -c pijul -n "__fish_seen_subcommand_from record" -l ignore-missing -d 'Ignore missing (deleted) files'
complete -c pijul -n "__fish_seen_subcommand_from record" -l patience -d 'Use Patience diff instead of the default Myers diff'
complete -c pijul -n "__fish_seen_subcommand_from record" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from diff" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from diff" -l channel -d 'Compare with this channel' -r
complete -c pijul -n "__fish_seen_subcommand_from diff" -l json -d 'Output the diff in JSON format instead of the default change text format'
complete -c pijul -n "__fish_seen_subcommand_from diff" -l tag -d 'Add all the changes of this channel as dependencies (except changes implied transitively), instead of the minimal dependencies'
complete -c pijul -n "__fish_seen_subcommand_from diff" -s s -l short -d 'Show a short version of the diff'
complete -c pijul -n "__fish_seen_subcommand_from diff" -s u -l untracked -d 'Include the untracked files'
complete -c pijul -n "__fish_seen_subcommand_from diff" -l patience -d 'Use Patience diff instead of the default Myers diff'
complete -c pijul -n "__fish_seen_subcommand_from diff" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from log" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from log" -l channel -d 'Show logs for this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from log" -l offset -d 'Start after this many changes' -r
complete -c pijul -n "__fish_seen_subcommand_from log" -l limit -d 'Output at most this many changes' -r
complete -c pijul -n "__fish_seen_subcommand_from log" -l output-format -r -f -a "{plaintext	,json	}"
complete -c pijul -n "__fish_seen_subcommand_from log" -l hash-only -d 'Only show the change hashes'
complete -c pijul -n "__fish_seen_subcommand_from log" -l state -d 'Include state identifiers in the output'
complete -c pijul -n "__fish_seen_subcommand_from log" -l description -d 'Include full change description in the output'
complete -c pijul -n "__fish_seen_subcommand_from log" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from push" -l repository -d 'Path to the repository. Uses the current repository if the argument is omitted' -r
complete -c pijul -n "__fish_seen_subcommand_from push" -l from-channel -d 'Push from this channel instead of the default channel' -r
complete -c pijul -n "__fish_seen_subcommand_from push" -l path -d 'Push changes only relating to these paths' -r
complete -c pijul -n "__fish_seen_subcommand_from push" -l to-channel -d 'Push to this remote channel instead of the remote\'s default channel' -r
complete -c pijul -n "__fish_seen_subcommand_from push" -s a -l all -d 'Push all changes'
complete -c pijul -n "__fish_seen_subcommand_from push" -s f -l force-cache -d 'Force an update of the local remote cache. May effect some reporting of unrecords/concurrent changes in the remote'
complete -c pijul -n "__fish_seen_subcommand_from push" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_seen_subcommand_from push" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from pull" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from pull" -l to-channel -d 'Pull into this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from pull" -l path -d 'Only pull to these paths' -r
complete -c pijul -n "__fish_seen_subcommand_from pull" -l from-channel -d 'Pull from this remote channel' -r
complete -c pijul -n "__fish_seen_subcommand_from pull" -s a -l all -d 'Pull all changes'
complete -c pijul -n "__fish_seen_subcommand_from pull" -s f -l force-cache -d 'Force an update of the local remote cache. May effect some reporting of unrecords/concurrent changes in the remote'
complete -c pijul -n "__fish_seen_subcommand_from pull" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_seen_subcommand_from pull" -l full -d 'Download full changes, even when not necessary'
complete -c pijul -n "__fish_seen_subcommand_from pull" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from change" -l repository -d 'Use the repository at PATH instead of the current directory' -r
complete -c pijul -n "__fish_seen_subcommand_from change" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from dependents" -l repository -d 'Use the repository at PATH instead of the current directory' -r
complete -c pijul -n "__fish_seen_subcommand_from dependents" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from rename; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from help" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from rename; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from rename; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a channel. The channel must not be the current channel'
complete -c pijul -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from rename; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from help" -f -a "rename" -d 'Rename a channel'
complete -c pijul -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from rename; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from help" -f -a "switch" -d 'Switch to a channel. There must not be unrecorded changes in the working copy'
complete -c pijul -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from rename; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from help" -f -a "new" -d 'Create a new, empty channel'
complete -c pijul -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from rename; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from switch" -s f -l force
complete -c pijul -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from switch" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from new" -l empty
complete -c pijul -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from new" -s f -l force
complete -c pijul -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from protocol" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from protocol" -l version -d 'Use this protocol version' -r
complete -c pijul -n "__fish_seen_subcommand_from protocol" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from git" -l stats -d 'Time the import, and output values to this file' -r
complete -c pijul -n "__fish_seen_subcommand_from git" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from move" -l salt -r
complete -c pijul -n "__fish_seen_subcommand_from move" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from list" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from add" -l salt -r
complete -c pijul -n "__fish_seen_subcommand_from add" -s r -l recursive
complete -c pijul -n "__fish_seen_subcommand_from add" -s f -l force
complete -c pijul -n "__fish_seen_subcommand_from add" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from remove" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from reset" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from reset" -l channel -d 'Reset the working copy to this channel, and change the current channel to this channel' -r
complete -c pijul -n "__fish_seen_subcommand_from reset" -l dry-run -d 'Print this file to the standard output, without modifying the repository (works for a single file only)'
complete -c pijul -n "__fish_seen_subcommand_from reset" -s f -l force -d 'Reset even if there are unrecorded changes'
complete -c pijul -n "__fish_seen_subcommand_from reset" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from debug" -l repository -r
complete -c pijul -n "__fish_seen_subcommand_from debug" -l channel -r
complete -c pijul -n "__fish_seen_subcommand_from debug" -l sanakirja-only
complete -c pijul -n "__fish_seen_subcommand_from debug" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from fork" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from fork" -l channel -d 'Make the new channel from this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from fork" -l change -d 'Apply this change after creating the channel' -r
complete -c pijul -n "__fish_seen_subcommand_from fork" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from unrecord" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from unrecord" -l channel -d 'Unrecord changes from this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from unrecord" -l show-changes -d 'Show N changes in a text editor if no <change-id>s were given. Defaults to the value of `unrecord_changes` in your global configuration' -r
complete -c pijul -n "__fish_seen_subcommand_from unrecord" -l reset -d 'Also undo the changes in the working copy (preserving unrecorded changes if there are any)'
complete -c pijul -n "__fish_seen_subcommand_from unrecord" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from apply" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from apply" -l channel -d 'Apply change to this channel' -r
complete -c pijul -n "__fish_seen_subcommand_from apply" -l deps-only -d 'Only apply the dependencies of the change, not the change itself. Only applicable for a single change'
complete -c pijul -n "__fish_seen_subcommand_from apply" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from remote; and not __fish_seen_subcommand_from default; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from remote; and not __fish_seen_subcommand_from default; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from remote; and not __fish_seen_subcommand_from default; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "default" -d 'Set the default remote'
complete -c pijul -n "__fish_seen_subcommand_from remote; and not __fish_seen_subcommand_from default; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "delete" -d 'Deletes the remote'
complete -c pijul -n "__fish_seen_subcommand_from remote; and not __fish_seen_subcommand_from default; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_seen_subcommand_from remote; and __fish_seen_subcommand_from default" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from remote; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from archive" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -l channel -d 'Use this channel, instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -l remote -d 'Ask the remote to send an archive' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -l state -d 'Archive in this state' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -l change -d 'Apply these changes after switching to the channel' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -l prefix -d 'Append this path in front of each path inside the archive' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -l umask -d 'Append this path in front of each path inside the archive' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -s o -d 'Name of the output file' -r
complete -c pijul -n "__fish_seen_subcommand_from archive" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_seen_subcommand_from archive" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from credit" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from credit" -l channel -d 'Use this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from credit" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -l repository -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -l channel -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "create" -d 'Create a tag, which are compressed channels. Note that tags are not independent from the changes they contain'
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "checkout" -d 'Restore a tag into a new channel'
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "reset" -d 'Reset the working copy to a tag'
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a tag from a channel. If the same state isn\'t tagged in other channels, delete the tag file'
complete -c pijul -n "__fish_seen_subcommand_from tag; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from checkout; and not __fish_seen_subcommand_from reset; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from create" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from create" -s m -l message -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from create" -l author -d 'Set the author field' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from create" -l channel -d 'Tag the current state of this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from create" -l timestamp -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from checkout" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from checkout" -l to-channel -d 'Optional new channel name. If not given, the base32 representation of the tag hash is used' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from checkout" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from reset" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from delete" -l repository -d 'Set the repository where this command should run. Defaults to the first ancestor of the current directory that contains a `.pijul` directory' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from delete" -l channel -d 'Delete the tag in this channel instead of the current channel' -r
complete -c pijul -n "__fish_seen_subcommand_from tag; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -s k -l no-cert-check -d 'Do not verify certificates (use with caution)'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -f -a "new" -d 'Create a new identity'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -f -a "repair" -d 'Repair the identity state on disk, including migration from older versions of Pijul'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -f -a "prove" -d 'Prove an identity to the server'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -f -a "list" -d 'Pretty-print all valid identities on disk'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit an existing identity'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove an existing identity'
complete -c pijul -n "__fish_seen_subcommand_from identity; and not __fish_seen_subcommand_from new; and not __fish_seen_subcommand_from repair; and not __fish_seen_subcommand_from prove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from edit; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l username -d 'Set the username' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l remote -d 'Set the default remote' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l display-name -d 'Set the display name' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l email -d 'Set the email' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l expiry -d 'Set the expiry' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l no-link -d 'Do not automatically link keys with the remote'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -l read-password -d 'Encrypt using a password from standard input. Requires --no-prompt'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from repair" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from repair" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from prove" -l name -d 'Set the name used to prove the identity' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from prove" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from prove" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l username -d 'Set the username' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l remote -d 'Set the default remote' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l display-name -d 'Set the display name' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l email -d 'Set the email' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l new-name -d 'Set the identity name' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l expiry -d 'Set the expiry' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l no-link -d 'Do not automatically link keys with the remote'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -l read-password -d 'Encrypt using a password from standard input. Requires --no-prompt'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from remove" -l name -d 'Set the name of the identity to remove' -r
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from remove" -l no-confirm -d 'Remove the matching identity without confirmation'
complete -c pijul -n "__fish_seen_subcommand_from identity; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from client" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from elvish; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from power-shell; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from elvish; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from power-shell; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from help" -f -a "bash"
complete -c pijul -n "__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from elvish; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from power-shell; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from help" -f -a "elvish"
complete -c pijul -n "__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from elvish; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from power-shell; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from help" -f -a "fish"
complete -c pijul -n "__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from elvish; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from power-shell; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from help" -f -a "power-shell"
complete -c pijul -n "__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from elvish; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from power-shell; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from help" -f -a "zsh"
complete -c pijul -n "__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from elvish; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from power-shell; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_seen_subcommand_from completion; and __fish_seen_subcommand_from bash" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from completion; and __fish_seen_subcommand_from elvish" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from completion; and __fish_seen_subcommand_from fish" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from completion; and __fish_seen_subcommand_from power-shell" -s h -l help -d 'Print help information'
complete -c pijul -n "__fish_seen_subcommand_from completion; and __fish_seen_subcommand_from zsh" -s h -l help -d 'Print help information'
