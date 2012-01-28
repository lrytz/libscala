# no dependencies
# 
_jrun_upvar() {
    if unset -v "$1"; then           # Unset & validate varname
        if (( $# == 2 )); then
            eval $1=\"\$2\"          # Return single value
        else
            eval $1=\(\"\${@:2}\"\)  # Return array
        fi
    fi
}

have()
{
  unset -v have
  type $1 &>/dev/null && have="yes"
}

# print each arg on its own line, for pipelining
args-into-lines () {
  for arg in "$@"; do
    printf "%s\n" "$arg"
  done
}

split-string () {
  local sep="$1" && shift
  local string="$@"

  while IFS="$sep" read -ra arr; do
    for x in "${arr[@]}"; do
      printf "%s\n" "$x"
    done
  done <<<"$string"
}

split-string-quoted () {
  local sep="$1" && shift
  while IFS="$sep" read -ra arr; do
    for x in "${arr[@]}"; do
      quote "$x"
    done
  done <<<"$@"
  
  # split-string "$@" | foreach-stdin jrun-quote "%1"
  # 
  # for x in $(split-string "$@"); do
  #   jrun-quote "$x"
  # done
  # 
  # local sep="$1" && shift
  # while IFS="$sep" read -r line; do
  #   jrun-quote "$x"
  # done <<<"$@"
}

join-string () {
  local sep="$1"
  shift
  savedIFS="$IFS"
  IFS="$sep" 
  echo "$*"
  IFS="$savedIFS"
  # ( saved="$IFS" && IFS="$1" && shift && echo "$*" && IFS="$saved" )
}

map-args () {
  local mapFn="$1"
  shift
  for arg; do echo $($mapFn "$arg"); done
}

contains () {
  grep -q "$2" <<<"$1"
}
containsWhitespace () {
  [[ "$1" != "${1% *}" ]]
  # contains "$1" " "
}
maybeQuote () {
  local arg="$1"

  if containsWhitespace "$arg"; then
    printf "\"%s\"\n" "$arg"
  else
    printf "%s\n" "$arg"
  fi
}

#### These are from bash-completion to avoid the dependency.

# This function shell-quotes the argument
quote()
{
    echo \'${1//\'/\'\\\'\'}\' #'# Help vim syntax highlighting
}

# This function shell-dequotes the argument
dequote()
{
    eval echo "$1" 2> /dev/null
}

