#!/bin/bash

	#echo "#" > aow.sh
	sudo adduser kewgen
	sudo usermod -a -G adm kewgen
	sudo sed -i.bak -e "s/\(^root.*ALL.*\)/\1\nkewgen  ALL=\(ALL:ALL\) ALL/" /etc/sudoers

	sudo adduser aow
	sudo usermod -a -G aow kewgen

    #install key for kewgen,aow
    #set Hostname
    #nano /etc/ssh/sshd_config
    #PermitRootLogin,PasswordAuthentication no
    #relogin

	sudo pwd

	sudo sed -i.bak -e "s/\(^LANG=.*\)/#\1\ \n LANGUAGE=en_US.UTF-8\n LC_ALL=en_US.UTF-8\n LANG=en_US.UTF-8\n LC_TYPE=en_US.UTF-8/" /etc/default/locale
	sudo locale-gen en_US.UTF-8
	sudo dpkg-reconfigure locales

	#restart login for locale settings
	exit

    sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
    sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
    
    sudo echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

    curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    echo deb http://apt.syncthing.net/ syncthing release | sudo tee /etc/apt/sources.list.d/syncthing-release.list

    sudo apt-get update

	sudo apt-get install htop
	sudo apt-get install iftop
	sudo apt-get install -y mc
	mc
	htop
	sudo apt-get install -y curl
	sudo apt-get install atop

  #sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
  #sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
  #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
  #sudo apt-get update
    sudo apt-get install -y oracle-java8-installer
    sudo apt-get install -y ant

#mysql
    sudo apt-get install -y mysql-server
    sudo sed -i.bak -e "s/\(^bind-address.*\)/#\1/" /etc/mysql/my.cnf
    sudo sed -i.bak -e "s/\(^# \* InnoDB.*\)/\1\ninnodb_flush_log_at_trx_commit = 2/" /etc/mysql/my.cnf
    #sudo replace '^bind-address' '#bind-address' -- /etc/mysql/my.cnf
    #sudo replace '# * InnoDB' '# * InnoDB\ninnodb_flush_log_at_trx_commit = 2' -- /etc/mysql/my.cnf
 #mysql -u root -p
 #CREATE USER 'aow'@'62.5.212.%' IDENTIFIED BY '12345';
 #GRANT ALL PRIVILEGES ON *.* TO 'aow'@'62.5.212.%' WITH GRANT OPTION;
 #db.recreate
 #ADD user aow to host 62.5.212.%,178.132.205.172,localhost,kuzmitch
    sudo service mysql restart
    sudo mysql -u root -p -e "CREATE USER 'kewgen'@'194.28.23.246' IDENTIFIED BY 'Stinger1945';GRANT ALL PRIVILEGES ON *.* TO 'kewgen'@'194.28.23.246' WITH GRANT OPTION;CREATE USER 'kewgen'@'178.132.205.%' IDENTIFIED BY 'Stinger1945';GRANT ALL PRIVILEGES ON *.* TO 'kewgen'@'178.132.205.%' WITH GRANT OPTION;CREATE USER 'aow'@'localhost' IDENTIFIED BY 'CABs968/drip';GRANT ALL PRIVILEGES ON *.* TO 'aow'@'localhost' WITH GRANT OPTION;"

#mongodb
 #UBUNTU
  #apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
  #echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
  #apt-get update
#    sudo apt-get install -y mongodb-org
 #DEBIAN
  #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
  #echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
  #sudo apt-get update
  #sudo apt-get install -y mongodb-org
  #mongo
  # >Failed global initialization: BadValue Invalid or no user locale set. Please ensure LANG and/or LC_* environment variables are set correctly.
  #export LC_ALL=C
   #sudo sed -i.bak -e "s/\(^exit 0\)/mount -t ext3 \/dev\/vdb1 \/aow\nexport LC_ALL=C\n iptables-restore \< \/root\/base.rules\ncd \/var\/lib\/syncthing\n\.\/syncthing \&\n\1/" /etc/rc.local
 #use analitics
 # OLD db.addUser("logger", "dU6wcS93%") ADD kewgen, db.addUser("kuzmitch", "tzwf6KmJoUZZvc8Kv0wJ")
 #db.createUser({user: "kewgen",pwd: "password",roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]}) 
 #db.createUser({user: "logger",pwd: "dU6wcS93%",roles: [ { role: "readWrite", db: "analitics" } ]})
 #db.createUser({user: "kuzmitch",pwd: "tzwf6KmJoUZZvc8Kv0wJ",roles: [ { role: "readWrite", db: "analitics" } ]})
#grep -v '^#' /etc/mongod.conf |grep -v ^\$
#	sudo sed -i.bak -e "s/^bind_ip =.*/#bind_ip = (1)/" /etc/mongod.conf
#	sudo mongo 127.0.0.1:27017/admin --eval 'db.system.users.remove({});db.system.version.remove({});db.system.version.insert({ "_id" : "authSchema", "currentVersion" : 3 })'
#	sudo service mongod restart
#	sudo mongo 127.0.0.1:27017/admin --eval 'db.createUser({user: "kewgen",pwd: "Stinger1945",roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]})'
#	sudo mongo 127.0.0.1:27017/analitics --eval 'db.createUser({user: "logger",pwd: "dU6wcS93%",roles: [ { role: "readWrite", db: "analitics" } ]})'
#	sudo mongo 127.0.0.1:27017/analiticsdev --eval 'db.createUser({user: "logger",pwd: "dU6wcS93%",roles: [ { role: "readWrite", db: "analiticsdev" } ]})'
#	sudo mongo 127.0.0.1:27017/analiticstest --eval 'db.createUser({user: "logger",pwd: "dU6wcS93%",roles: [ { role: "readWrite", db: "analiticstest" } ]})'
#scripts 
 #scp /Users/kewgen/Documents/apps/aow/actions.sh aowamazon:build.locale.properties    action.sh,build.xml,build.locale.properties
 #scp -r /Users/kewgen/Documents/apps/aow/lib aowamazon:lib
 #scp -r /Users/kewgen/Documents/apps/aow/deploy aowamazon:deploy
#root denied
#Yourkit
 #wget https://www.yourkit.com/download/yjp-2015-build-15056-linux.tar.bz2
 #tar xfj yjp-2015-build-15056-linux.tar.bz2
#Syncthing
 #wget https://github.com/syncthing/syncthing/releases/download/v0.11.3/syncthing-linux-amd64-v0.11.3.tar.gz
 #tar xvfz syncthing-linux-amd64-v0.11.3.tar.gz

	sudo apt-get install -y collectd
	sudo apt-get install bcache-tools

	curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list
    sudo apt-get update
	sudo apt-get install -y syncthing
	syncthing&
	sudo killall syncthing
	sed -i.bak -e "s/<address>127.0.0.1:8384<\/address>/<address>0.0.0.0:8384<\/address>/" .config/syncthing/config.xml
	syncthing&
	sudo apt-get install smartmontools -y
	#smartctl -a /dev/sda

	#wget https://download.elastic.co/logstash-forwarder/binaries/logstash-forwarder_0.4.0_amd64.deb
	#sudo dpkg -i logstash-forwarder_0.4.0_amd64.deb
	#todo copy config

	sudo apt-get install percona-toolkit

	sudo apt-get autoremove

    #echo =======MONGO
    #grep -v '^#' /etc/mongod.conf |grep -v ^\$
    echo =======MYSQL
    grep -v '^#' /etc/mysql/my.cnf |grep -v ^\$
    sudo service --status-all
    sudo ulimit -n 9999
    sudo ulimiy -a
    pt-summary
    pt-mysql-summary
