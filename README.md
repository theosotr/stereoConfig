#Puppet configuration for the stereo host
##Puppet installation
1. wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
2. dpkg -i puppetlabs-release-wheezy.deb
3. apt-get update
4. apt-get install puppet

##Hiera setup
1. Copy hiera.yaml to /etc/
2. Copy common.yaml to /etc/puppet/hieradata/

##Clone config repo
git clone git@github.com:tushartushar/stereoConfig.git

##Apply puppet manifests
cd stereoConfig/
sudo ./run.sh >puppetLog.txt 2>puppetErr.txt

