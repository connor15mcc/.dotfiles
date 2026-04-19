function zellij_tab_naming
    if test -n $ZELLIJ
        command nohup zellij action rename-pane (basename $PWD) >/dev/null 2>&1
        command nohup zellij action rename-tab (basename $PWD) >/dev/null 2>&1
    end
end
