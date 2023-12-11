#!/bin/bash
echo "[root@localhost ~]# sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config"
sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
echo "[root@localhost ~]# setenforce 0"
setenforce 0
echo "[root@localhost ~]# yum install -y gcc glibc glibc-common wget unzip httpd php php-cli gd gd-devel openssl-devel net-snmp perl -y"
yum install -y gcc glibc glibc-common wget unzip httpd php php-cli gd gd-devel openssl-devel net-snmp perl -y
echo "[root@localhost ~]# yum install -y make gettext autoconf net-snmp-utils epel-release automake"
yum install -y make gettext autoconf net-snmp-utils epel-release automake
echo "[root@localhost ~]# cd /tmp"
cd /tmp
echo "[root@localhost ~]# wget -O nagioscore.tar.gz https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.5.0.tar.gz"
wget -O nagioscore.tar.gz https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.5.0.tar.gz
echo "[root@localhost ~]# tar xzf nagioscore.tar.gz"
tar xzf nagioscore.tar.gz
echo "[root@localhost ~]# cd nagios-4.5.0/"
cd nagios-4.5.0/
echo "[root@localhost ~]# ./configure"
./configure
echo "[root@localhost ~]# make all"
make all
echo "[root@localhost ~]# make install-groups-users"
make install-groups-users
echo "[root@localhost ~]# usermod -a -G nagios apache"
usermod -a -G nagios apache
echo "[root@localhost ~]# make install"
make install
echo "[root@localhost ~]# make install-commandmode"
make install-commandmode
echo "[root@localhost ~]# make install-config"
make install-config
echo "[root@localhost ~]# make install-webconf"
make install-webconf
echo "[root@localhost ~]# make install-daemoninit "
make install-daemoninit 
echo "[root@localhost ~]# systemctl enable httpd.service"
systemctl enable httpd.service
echo "[root@localhost ~]# firewall-cmd --zone=public --add-port=80/tcp"
firewall-cmd --zone=public --add-port=80/tcp
echo "[root@localhost ~]# firewall-cmd --zone=public --add-port=80/tcp --permanent"
firewall-cmd --zone=public --add-port=80/tcp --permanent
echo "[root@localhost ~]# htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin"
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
echo "[root@localhost ~]# systemctl start httpd"
systemctl start httpd
echo "[root@localhost ~]# yum install -y make gettext automake autoconf wget openssl-devel net-snmp net-snmp-utils epel-release"
yum install -y make gettext automake autoconf wget openssl-devel net-snmp net-snmp-utils epel-release
echo "[root@localhost ~]# yum install -y perl-Net-SNMP"
yum install -y perl-Net-SNMP
echo "[root@localhost ~]# cd /tmp"
cd /tmp
echo "[root@localhost ~]# wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz"
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
echo "[root@localhost ~]# tar zxf nagios-plugins.tar.gz"
tar zxf nagios-plugins.tar.gz
echo "[root@localhost ~]# cd /tmp/nagios-plugins-release-2.2.1/"
cd /tmp/nagios-plugins-release-2.2.1/
echo "[root@localhost ~]# "./tools/setup
./tools/setup
echo "[root@localhost ~]# ./configure"
./configure
echo "[root@localhost ~]# make"
make
echo "[root@localhost ~]# make install"
make install
echo "[root@localhost ~]# yum -y install nagios-plugins-nrpe"
yum -y install nagios-plugins-nrpe
echo "[root@localhost ~]# yum -y install nagios-plugins-nrpe"
yum -y install nagios-plugins-nrpe

sudo bash -c "cat > /usr/local/nagios/etc/nagios.cfg <<EOF
cfg_dir=/usr/local/nagios/etc/servers
EOF"
echo "[root@localhost ~]#  vi /usr/local/nagios/etc/nagios.cfg"
 vi /usr/local/nagios/etc/nagios.cfg

echo "[root@localhost ~]# mkdir /usr/local/nagios/etc/servers"
mkdir /usr/local/nagios/etc/servers

echo "[root@localhost ~]# vi /usr/local/nagios/etc/objects/commands.cfg"

sudo bash -c "cat > /usr/local/nagios/etc/servers/client1.cfg <<EOF
define host{

            use                     linux-server
            
            host_name               centos7.client1
            
            alias                   centos7.client1
            
            address                 client_ip

}
EOF"

echo "[root@localhost ~]# vi /usr/local/nagios/etc/servers/client1.cfg"
vi /usr/local/nagios/etc/servers/client1.cfg
echo "[root@localhost ~]# /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg"
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
echo "[root@localhost ~]# systemctl restart nagios"
systemctl restart nagios
echo "[root@localhost ~]# firewall-cmd --permanent --add-port=5666/tcp"
firewall-cmd --permanent --add-port=5666/tcp
echo "[root@localhost ~]# firewall-cmd --reload"
firewall-cmd --reload
