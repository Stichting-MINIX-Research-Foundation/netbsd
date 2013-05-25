#!/bin/sh

# Invocation of this script : 
#  For a first checkout, supposing your are in the src directory : 
#  $ ./netbsd-cvs.sh checkout -A -P -D '2012/10/17 12:00:00 UTC' src
#
#  For updates (hypotesis, current directory is the git root directory
#  $ ./netbsd-cvs.sh update -A -Pd -D "2012/10/18 12:00:00 UTC"

: ${NETBSD_SRC=..}

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
