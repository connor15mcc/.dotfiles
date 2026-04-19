function fish_jj_prompt
  if not command -sq jj
    return 1
  end

  if not jj --ignore-working-copy root --quiet &>/dev/null
    return 1
  end

  set -l info $(jj --ignore-working-copy log \
    --no-graph \
    --revisions @\
    --template '
      change_id.shortest() ++ 
      if(description, " " ++ description.first_line())
    ' 2>/dev/null
  );

  if test -n "$info"
    printf ' (jj:%s)' $info
  end
end
