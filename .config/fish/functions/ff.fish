function ff
    set result (git ls-files | fzf --ansi \
        --height 15 \
        --preview 'bat --color=always --style=numbers {1} 2>/dev/null || cat {1}' \
        --preview-window 'right:60%:noborder')

    if test -n "$result"
        nvim "$result"
    end
end
