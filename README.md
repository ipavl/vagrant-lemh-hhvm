vagrant-lemh-hhvm
-----------------

[Vagrant](https://www.vagrantup.com/) configuration to create a development environment with Ubuntu 16.04 LTS (Xenial Xerus), [nginx](https://nginx.org/), [MariaDB](https://mariadb.org/), and [Hack](http://hacklang.org)/[HHVM](http://hhvm.com/).

Usage
-----

Make sure you have [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) installed.

Clone this repository:

```
$ git clone https://github.com/ipavl/vagrant-lemh-hhvm
$ cd vagrant-lemh-hhvm
```

Create/start the VM:

```
$ vagrant up
```

Once that finishes, the server's HHVM `phpinfo()` should be viewable at http://192.168.33.10/ (this can be changed in `Vagrantfile`).

You can run `rm -rf .git && git init` to re-initialize this repository to use with your own project.

Notes
-----

* The files in this directory are accessible at `/vagrant` in the VM
* nginx is configured to serve files from `/vagrant/public` by default
* The username and password for MariaDB are both "root" (`mysql -u root -proot` from the command line)
* HHVM errors are logged at `/var/log/hhvm/error.log`
