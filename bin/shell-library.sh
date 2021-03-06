# Various functions meant to be loaded by .bashrc

function usage {
  echo "error: $*" 2>&1
  exit 1
}

# Back up an existing file.
function bak() {
  cp "$@"{,.bak}
}

# Securely create a temporary directory.
function tmpdir() {
  tmp=${TMPDIR-/tmp}
  tmp=$tmp/somedir.$RANDOM.$RANDOM.$RANDOM.$$
  (umask 077 && mkdir $tmp) || {
    echo "Could not create temporary directory! Exiting." 1>&2 
    exit 1
  }
}

function psgrep {
  ps axuf | grep -v grep | grep "$@" -i --color=auto;
}

function fname {
  find . -iname "*$@*";
}

function lt {
  ls -targ "$@" | tail;
}
