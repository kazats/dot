function fish_prompt

  set -l last_status $status

  show_status $last_status
end


function mode_color

  switch $fish_bind_mode
    case default
    echo cyan
    case insert
    echo blue
    case replace
    echo green
    case replace_one
    echo green
    case visual
    echo magenta
    case '*'
    echo red
  end
end


function show_path

  set -l bg (mode_color)

  set_color    black
  set_color -b $bg

  echo -en "" (prompt_pwd -d 100) ""
end


function show_status -a last_status

  set -l bg     (mode_color)
  set -l prompt '＊'

  set_color    black
  set_color -b $bg

  if [ $last_status -ne 0 ]
    set prompt ' ⟨ '
  else
    set prompt ' ⟩ '
  end

  echo -en $prompt

  set_color    normal
  set_color -b normal

  echo -en ' '
end


function fish_right_prompt

  set_color brblack

  show_virtualenv_name
  show_git_info
  show_path

  set_color normal
end


function show_virtualenv_name

  if set -q VIRTUAL_ENV
    echo -en "" (basename "$VIRTUAL_ENV")
  end
end


function show_git_info

  set_color    (mode_color)
  set_color -b 26233a

  # set -g __fish_git_prompt_color_prefix '#26233a'
  # set -g __fish_git_prompt_color_suffix '#26233a'

  set -l git_prompt (string replace -ra '\(|\)' '' (fish_git_prompt))

  echo -en $git_prompt ""
end


# function show_git_info
#
#   set -l LIMBO      /dev/null
#   set -l git_status (git status --porcelain 2> $LIMBO)
#   set -l git_stash  (git stash list 2> $LIMBO)
#   set -l dirty      ""
#
#   [ $status -eq 128 ]; and return  # Not a repository? Nothing to do
#
#   # If there is modifications, set repository dirty to '*'
#   if not [ -z (echo "$git_status" | grep -e '^ M') ]
#     set dirty "*"
#   end
#
#   # If there is new or deleted files, add '+' to dirty
#   if not [ -z (echo "$git_status" | grep -e '^[MDA]') ]
#     set dirty "$dirty+"
#   end
#
#   # If there is stashed modifications on repository, add '^' to dirty
#   if not [ -z (echo "$git_stash") ]
#     set dirty "$dirty^"
#   end
#
#   set_color    (mode_color)
#   set_color -b 26233a
#
#   echo -en "" (git_branch_name)$dirty ""
# end
