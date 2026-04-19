function zellij_tab_name --on-variable PWD
  if set -q ZELLIJ
    command nohup zellij action rename-pane (basename $PWD) >/dev/null 2>&1
    command nohup zellij action rename-tab (basename $PWD) >/dev/null 2>&1
  end
end

