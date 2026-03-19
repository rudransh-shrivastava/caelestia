if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # Better ls
    alias ls='eza --icons --group-directories-first -1'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gca 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
    
    # Custom fish config
    source ~/.config/caelestia/user-config.fish 2> /dev/null
end

# tmux-sessionizer
if not contains $HOME/.config/scripts $PATH
    set PATH $PATH $HOME/.config/scripts/
end
bind \cf 'tmux-sessionizer'
bind \eh 'tmux-sessionizer -s 0\n'
bind \ej 'tmux-sessionizer -s 1\n'
bind \ek 'tmux-sessionizer -s 2\n'
bind \el 'tmux-sessionizer -s 3\n'

function vmrss
  if test (count $argv) -eq 0
    echo "Usage: vmrss <PID>"
    return 1
  end
  set pid $argv[1]
  if test -f "/proc/$pid/status"
    grep VmRSS /proc/$pid/status
  else
    echo "Process with PID $pid not found."
    return 1
  end
end
