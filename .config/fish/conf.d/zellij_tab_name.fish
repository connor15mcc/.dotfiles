function zellij_tab_name --on-variable PWD
  if set -q ZELLIJ
    set -l name (basename $PWD)
    begin
      command zellij action rename-pane $name
      command zellij action rename-tab $name
    end >/dev/null 2>&1 &
    disown 2>/dev/null
  end
end
