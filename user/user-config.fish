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

# Abbr tweaks (mac)
abbr --erase gc gst gsp gp gpl gbd 2> /dev/null
abbr gca 'git commit -am'