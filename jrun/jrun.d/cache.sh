# cache
#

[[ -n "$jrun_home" ]] && {
  jrun_cache="$jrun_home/.cache"
  jrun_make_cachedir () {
    local dir="$jrun_cache/classes/$1"
    mkdir -p "$dir"
    echo "$dir"
  }

  jrun-explode () {
    for arg; do
      if [[ -d "$arg" ]]; then
        echo "$arg"
      else
        local absolute_jar=$(absolute_path "$arg")
        local md5=$(md5 -q "$arg")
        local cachedir=$(jrun_make_cachedir "$md5")
    
        [[ -f "$cachedir.complete" ]] || {
          ( cd "$cachedir" && rm -rf "$md5" && jar xf "$absolute_jar" && touch "$cachedir.complete" )
        } && echo "$cachedir"
      fi
    done
  }
}