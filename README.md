#Puppet configuration for the stereo host
##Puppet installation
1. wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
2. dpkg -i puppetlabs-release-wheezy.deb
3. apt-get update
4. apt-get install puppet

##Hiera setup
1. Copy hiera.yaml to /etc/
2. Copy common.yaml to /etc/puppet/hieradata/ (It contains username and corresponding password for each user in key value form.)

##Clone config repo
git clone git@github.com:istlab/stereoConfig.git

##Check puppet manifests
It is a good practice to confirm whether the catalog compiles without errors and what are the changes going to happen. You may use the following command for the same:
- cd stereoConfig/
- sudo ./run.sh --noop

##Apply puppet manifests
- cd stereoConfig/
- sudo ./run.sh >puppetLog.txt 2>puppetErr.txt

