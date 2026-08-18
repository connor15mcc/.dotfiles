function fish_jj_prompt
  # locate the repo root with builtins only
  set -l root $PWD
  while not test -d $root/.jj
    if test $root = /
      return 1
    end
    set root (path dirname $root)
  end

  if not command -sq jj
    printf ' (jj:uninstalled)'
    return 0
  end

  # our prompt can only change via changes to op-heads (because we ignore
  # working copy changes via `--no-working-copy), so this is a perfect hash key
  set -l heads $root/.jj/repo/op_heads/heads/*
  if test (count $heads) -eq 0
    printf ' (jj:no op_heads under %s/.jj/repo)' $root
    return 0
  end
  set -l key (string join ' ' $heads)

  if test "$key" = "$__fish_jj_prompt_key"
    printf ' (jj:%s)' $__fish_jj_prompt_val
    return 0
  end

  set -l info $(jj --ignore-working-copy log \
    --no-graph \
    --revisions @\
    --template '
      change_id.shortest() ++
      if(description, " " ++ description.first_line())
    ' 2>/dev/null
  );

  if test -z "$info"
    printf ' (jj:log failed in %s)' $root
    return 0
  end

  set -g __fish_jj_prompt_key $key
  set -g __fish_jj_prompt_val $info
  printf ' (jj:%s)' $info
end
