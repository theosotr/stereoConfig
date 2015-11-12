System setup Puppet scripts for the swanalytics host

# Deployment
To deploy on a new Debian host use roughly the following procedure.

```sh
apt-get update
apt-get upgrade
apt-get install puppet
# On the host where a copy of the repo is located
tar -C .. cf - puppet | ssh root@83.212.168.34 tar xf -
./run.sh
```

Note: the bootstrapping run.sh script has not been tested with the Puppet code yet.
