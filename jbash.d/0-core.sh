# core functions
#

_jlog_init () {
  jlog "[init] command line is $jbash_sh $jbash_sh_args"
  jlog "[init] jbash_home is $jbash_home"
} && _jlog_init

isSet () {
  [[ $# -eq 1 ]] && {
    jlog "$(caller 0)   => isSet($1)"
    [[ "x${!1}" != "x" ]]
  }
}
