function yank
    set -x YANK_COMMANDLINE (status current-commandline)
    command yank $argv
end
