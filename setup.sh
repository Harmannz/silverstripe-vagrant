yum update -y --disableplugin=fastestmirror
systemctl restart sshd

yum install -y httpd httpd-devel mod_ssl
yum -y install php php-common php-mysql php-pdo php-mcrypt* php-gd php-xml php-mbstring
echo "Include /vagrant/apache/*.conf" >> /etc/httpd/conf/httpd.conf
echo "date.timezone = Pacific/Auckland" >> /etc/php.ini
systemctl start httpd.service
systemctl enable httpd.service

yum install -y mariadb-server mariadb
systemctl start mariadb.service
systemctl enable mariadb.service