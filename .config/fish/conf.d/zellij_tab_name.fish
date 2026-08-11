function zellij_tab_name --on-variable PWD
  if test "$ZELLIJ" = 1
    set -l name (basename $PWD)
    begin
      command zellij action rename-pane $name
      command zellij action rename-tab $name
    end >/dev/null 2>&1 &
    disown
  end
end

