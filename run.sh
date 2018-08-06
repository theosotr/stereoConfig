#!/bin/bash

# Setup puppet to pull its files from the following directory
FILEDIR=/etc/puppet
#FILEDIR=/usr/share/puppet

# Required modules
MODULES='puppetlabs-apt puppet-nodejs initforthe-build_essential'

if ! [ -w / ]
then
	echo "This program must be run with root privileges" 1>&2
	exit 1
fi

# Report usage information and exit
usage()
{
	cat <<\EOF 1>&2
Usage:

run [-c configuration] [-y] [---debug] [--graph] [--graphdir name] [--noop]
-c|--config name	Specify the configuration to use.
			This can be one of the following:
			production, testing, development, cluster
-y|--asumeyes		Proceed without asking if the specified configuration
			does not match the host's tag, and if the host's
			software requires upgrading.
--debug			Passed to Puppet to generate more verbose output
--graph			Passed to Puppet to generate a dependency graph
--graphdir name		Location of the graph output
--noop			Passed to Puppet to effect a dry-run

Terminating...
EOF
	exit 1
}

# Option processing; see /usr/share/doc/util-linux-ng-2.17.2/getopt-parse.bash
# Note that we use `"$@"' to let each command-line parameter expand to a 
# separate word. The quotes around `$@' are essential!
# We need TEMP as the `eval set --' would nuke the return value of getopt.

TEMP=`getopt -o y,c: --long assumeyes,config:,debug,graph,graphdir:,noop -n 'run' -- "$@"`

if [ $? != 0 ] ; then
	usage
fi

# Note the quotes around `$TEMP': they are essential!
eval set -- "$TEMP"

while : ; do
case "$1" in
	-c|--config)	OPTCONF="$2" ; shift 2 ;;
	--debug|--graph|--noop) PUPPETOPT="$PUPPETOPT $1" ; shift ;;
	--graphdir)	PUPPETOPT="$PUPPETOPT $1 $2" ; shift 2 ;;
	-y|--assumeyes)	YES=-y ; shift ;;

	--) shift ; break ;;
	*) echo "Internal error!" ; exit 1 ;;
esac
done

# No more arguments allowed
if [ "$1" != '' ]
then
	usage
fi

# Comment out the following 5 source code lines if the setting is
# in GRNET's synnefo.
# Also discard the README notes and place this script in a cron job
# run at boot time.
# This process matches synnefo's image creator. Because the complete software
# setting will already be in an available OS image, we only need to make Codebox
# run once a newly created VM runs.

# Setup puppet to work from the current directory
rm -rf $FILEDIR/manifests
rm -rf $FILEDIR/modules

mkdir -p $FILEDIR
ln -s `pwd`/manifests $FILEDIR/manifests
ln -s `pwd`/modules $FILEDIR/modules

# Update packages before running
# yum $YES update

# Ensure required Puppet modules are installed
for m in $MODULES
do
	name=$(expr "$m" : '.*-\(.*\)')
	if ! [ -d /etc/puppet/modules/$name/ ]
	then
		mkdir -p /etc/puppet/modules
		puppet module install $m
	fi
done

puppet apply --modulepath=/home/tushar/stereoConfig/modules/ $PUPPETOPT $FILEDIR/manifests/
