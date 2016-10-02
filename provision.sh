#!/bin/sh

apt-get update

apt-get install -y nginx
apt-get install -y mariadb-server
apt-get install -y software-properties-common

apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"
apt-get update
apt-get install -y hhvm

# Start HHVM at boot
sudo update-rc.d hhvm defaults
# HHVM FastCGI setup
sudo /usr/share/hhvm/install_fastcgi.sh

# Suppress NFS-related errors
sudo bash -c 'cat << EOF > /etc/hh.conf
  enable_on_nfs = true
EOF'
sudo service hhvm restart

# Change nginx document root to /vagrant/public
sed -i 's:root /var/www/html:root /vagrant/public:g' /etc/nginx/sites-available/default
# Add index.php to the list of index files
sed -i 's/index.nginx-debian.html/index.php/g' /etc/nginx/sites-available/default
sudo service nginx restart

# Secure database and set password to "root"
mysql_secure_installation <<-SHELL

  y
  root
  root
  y
  y
  y
  y
SHELL

mysql -u root <<-SQL
  use mysql;
  update user set plugin=' ' where User='root';
  flush privileges;
  exit
SQL