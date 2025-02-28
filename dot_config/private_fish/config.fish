if test -f ~/.aliases
    source ~/.aliases
end
function jq_logs
    jq -r '[(.__REALTIME_TIMESTAMP | sub("......$"; "") | tonumber | todate), ._HOSTNAME, ._PID, .SYSLOG_IDENTIFIER, .MESSAGE] | @tsv'
end

if test -f /opt/homebrew/bin/brew
   eval "$(/opt/homebrew/bin/brew shellenv)"
end

if test -f /usr/local/bin/brew
   eval "$(/usr/local/bin/brew shellenv)"
end

if status is-interactive
  # Commands to run in interactive sessions can go here
  function fish_greeting
    if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

    # The greeting used to be skipped when fish_greeting was empty (not just undefined)
    # Keep it that way to not print superfluous newlines on old configuration
    test -n "$fish_greeting"
    and echo $fish_greeting
  end
  
end
