# Termux Setup
1. apt update
2. apt upgrade
3. apt install coreutils
4. apt install termux-tools proot util-linux net-tools tracepath tree wget curl procps mlocate man gettext
5. apt install ccrypt libcrypt libcrypt-dev gnupg2
6. apt install grep bash-completion 
7. apt install openssh git subversion php nodejs mariadb nginx php-fpm python python-dev python2 python2-dev ruby ruby-dev golang make make-dev
8. apt install rclone neovim ctags
9. termux-setup-storage

# Neovim/Deoplete Setup
* python2 -m pip install neovim
* pip install --upgrade pip
* pip3 install neovim
* gem install neovim
* npm install -g neovim

# MariaDB Setup
~Default install instructions after package has been installed~
```
To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
To do so, start the server, then issue the following commands:

'/data/data/com.termux/files/usr/bin/mysqladmin' -u root password 'new-password'
'/data/data/com.termux/files/usr/bin/mysqladmin' -u root -h localhost password 'new-password'

Alternatively you can run:
'/data/data/com.termux/files/usr/bin/mysql_secure_installation'

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the MariaDB Knowledgebase at http://mariadb.com/kb or the
MySQL manual for more instructions.

You can start the MariaDB daemon with:
cd '/data/data/com.termux/files/usr' ; /data/data/com.termux/files/usr/bin/mysqld_safe --datadir='/data/data/com.termux/files/usr/var/lib/mysql'

You can test the MariaDB daemon with mysql-test-run.pl
cd '/data/data/com.termux/files/usr/mysql-test' ; perl mysql-test-run.pl

Please report any problems at http://mariadb.org/jira

The latest information about MariaDB is available at http://mariadb.org/.
You can find additional information about the MySQL part at:
http://dev.mysql.com
Consider joining MariaDB's strong and vibrant community:
https://mariadb.org/get-involved/
```
