#!/usr/bin/env bash
#
# Create a "collection" from a classpath.
# The elements of the collection are lines of output.
# 

cwd-files-escaped () {
  find . -type f -print | sed 's/ /\\ /g;'
}
cwd-files-quoted () {
  find . -type f -print | sed 's#^./##;' | map quote %1
}

# Use %1 for the current file
cwd-foreach-file () {
  cwd-files-quoted | map "$@"
  # 
  # if [[ $# -eq 0 ]]; then
  #   local cmd="echo \$1"
  # else
  #   local cmd=$(jrun-percent-substitution "$@")
  # fi
  # 
  # find . -type f -print0 | while IFS= read -r -d '' file; do set -- "$file"; eval $cmd; done
}

cwd-files-ext () {
  find . -type f -print | grep ".$1\$"
}
