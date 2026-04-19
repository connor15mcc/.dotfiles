function venv
    command venv $argv
    if test -f venv/bin/activate
        source venv/bin/activate
    end
end
