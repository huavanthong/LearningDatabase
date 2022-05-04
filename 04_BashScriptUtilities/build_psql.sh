#! /bin/bash

# make sure we have all 3 input parameters -
#
#      postgresql version (for selecting from multiple version directories
#      build name (to differenciate between build)
#      port number
#
if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
   then
      echo "Usage: "$0" <postgresql version> <port number> <build name>"
	  echo "Ex:    "$0" 11.4 5432 test_build"
      exit 1
fi

# set postgresql version
pver=$1

# set port number
port=$2

# set build name
bname="psql"-$pver-$port-$3

# parent directory of PostgreSQL source repository
pdir="/home/hvthong/projects/repos"

# set working directory to PostgreSQL source repository
cd $pdir/postgresql-$pver

# form build directory
builddir=$(pwd)/$bname

# check to see if build directory exists
if [ -d $builddir ]
then
   echo "Build directory exists!"
   ls -ald $builddir
   echo "You need to remove it first. Exiting,..."
   exit 1
fi

# display build info
echo "**********************************************************************"
echo "Will install into ["$builddir"]"
echo "Will use port ["$port"]"
echo "**********************************************************************"
read -p "Press any key to continue,..." -n1 -s
echo ""
echo ""
echo "Starting build,..."

# clean build
make clean >/dev/null

# check for error, exit if found
if [ $? -ne 0 ]
then
   echo "make clean: found an error. Probably initial build."
fi

# make directory for install
mkdir $builddir

# configure the build
./configure \
   --enable-depend \
   --prefix=$builddir \
   --with-pgport=$port \
   --enable-cassert --enable-debug CFLAGS="-ggdb -O0 -fno-omit-frame-pointer" \
   > /dev/null

# check for error, exit if found
if [ $? -ne 0 ]
then
   echo "configure: found an error. Exiting,..."
   exit 1
fi

# get the number of processors
numproc=$(grep processor /proc/cpuinfo | wc -l)

# make build across all processors
make -j$numproc >/dev/null

# check for error, exit if found
if [ $? -ne 0 ]
then
   echo "make -j"$numproc": found an error. Exiting,..."
   exit 1
fi

# install build
make install >/dev/null

# check for error, exit if found
if [ $? -ne 0 ]
then
   echo "make install: found an error. Exiting,..."
   exit 1
fi

# create data directory
mkdir $builddir/data

# initialize database
$builddir/bin/initdb -D $builddir/data

# check for error, exit if found
if [ $? -ne 0 ]
then
   echo $builddir"/bin/initdb -D "$builddir"/data: found an error. Exiting,..."
   exit 1
fi

# starting database
$builddir/bin/pg_ctl -D $builddir/data -l $builddir/logfile start

# check for error, exit if found
if [ $? -ne 0 ]
then
   echo $builddir"/bin/pg_ctl -D "$builddir"/data -l "$builddir"/logfile start: found an error. Exiting,..."
   exit 1
fi

# Create the test database
$builddir/bin/createdb -p $port $bname

# check for error, exit if found
if [ $? -ne 0 ]
then
   echo $builddir"/bin/createdb -p "$port" test: found an error. Exiting,..."
   exit 1
fi

# to make life a bit easier
echo "***************************************************************************"
echo "To log into this database use -"
echo $builddir"/bin/psql -p "$port" "$bname
echo ""

echo "To shutdown this database use -"
echo $builddir"/bin/pg_ctl stop -D "$builddir"/data"
echo ""

echo "To start up this database use -"
echo $builddir"/bin/pg_ctl -D "$builddir"/data -l "$builddir"/logfile start"
echo ""
