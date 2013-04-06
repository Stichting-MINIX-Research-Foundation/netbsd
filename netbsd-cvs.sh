#!/bin/sh

# Invocation of this script : 
#  $ ./netbsd-cvs.sh checkout -A -P -D "2012/10/17 12:00:00 UTC" src -d .
#  $ ROOT=/some/path ./netbsd-cvs.sh checkout -A -P -D "2012/10/17 12:00:00 UTC" src -d .
#  $ NETBSD_SRC=/some/absolute/path ./netbsd-cvs.sh checkout -A -P -D "2012/10/17 12:00:00 UTC" src -d .

: ${ROOT=.}
: ${NETBSD_SRC=${ROOT}/netbsd}

if [ "$#" -lt "1" ]; then
  echo "Wrong number of arguments."
  exit 1
fi

if [ ! -d ${NETBSD_SRC} ]; then
  echo "CVS Root dir does not exist or is not a directory : ${NETBSD_SRC}"
  exit 2
fi

cd ${NETBSD_SRC}
export CVS_RSH="ssh"
export CVSROOT="anoncvs@anoncvs.netbsd.org:/cvsroot"
cvs "$@"
cd -
