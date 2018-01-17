# Puppet configuration for the stereo host
## Puppet installation
1. wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
2. sudo dpkg -i puppetlabs-release-wheezy.deb
3. sudo apt-get update
4. sudo apt-get install puppet
5. sudo gem install hiera

## Clone config repo
git clone git@github.com:istlab/stereoConfig.git

## Hiera setup
1. Copy hiera.yaml to /etc/
2. Copy common.yaml to /etc/puppet/code/hiera/ 
(The common.yaml file contains username and corresponding password for each user in key value form.
<username>: <password>)

## Check puppet manifests
It is a good practice to confirm whether the catalog compiles without errors and what are the changes going to happen. You may use the following command for the same:
- cd stereoConfig/
- sudo ./run.sh --noop
- In case of error, try `sudo ./run.sh --noop --debug' to debug the error

## Apply puppet manifests
- cd stereoConfig/
- sudo ./run.sh >puppetLog.txt 2>puppetErr.txt

## Findings related to Puppet 4
- Do not use resource name (class name etc.) with dash i.e., replace 'class apt-get' with 'class aptget'. Puppet 4 will complain.
- Do not name any resource with name 'attr' - this will result in a strange error and it took a long time for me to figure out.