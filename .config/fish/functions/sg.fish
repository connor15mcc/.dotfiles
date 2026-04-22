function sg
    set result (fzf --ansi --disabled --query '' \
        --height 15 \
        --bind 'change:reload:rg --color=always --line-number --no-heading --smart-case {q} || true' \
        --delimiter : \
        --preview 'bat --color=always --style=numbers --highlight-line {2} {1} 2>/dev/null || tail -n +$(({2}-20)) {1} | head -40' \
        --preview-window 'right:60%:noborder')

    if test -n "$result"
        set file (echo $result | awk -F: '{print $1}')
        set line (echo $result | awk -F: '{print $2}')
        nvim +"$line" "$file"
    end
end
