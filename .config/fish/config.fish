set -gx TERM xterm-256color
if not pgrep -u $USER ssh-agent > /dev/null
    eval (ssh-agent -c)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

