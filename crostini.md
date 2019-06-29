# Crostini Development Setup

## Remove Unneeded Packages

`sudo apt remove apache2`


## Install Required Packages

```bash
sudo apt install net-tools tree wget curl procps mlocate man gettext
sudo apt install ccrypt gnupg2
sudo apt install grep bash-completion
sudo apt install git subversion php nodejs mariadb-server nginx php-fpm python python-dev python3 python3-dev ruby ruby-dev golang make
sudo apt install rclone ctags
sudo apt install software-properties-common
sudo apt install python-pip python-setuptools python-setuptools-git
sudo apt install ca-certificates apt-transport-https
```

## Install PHP 7.3

1. `wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -`
3. `echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list`
4. `sudo apt update`
5. `sudo apt upgrade`
6. `sudo apt install php7.3-fpm php7.3-opcache php7.3-xml php7.3-xsl`


## Setup Shell

1. Install
   - `~/.ssh/timnolte_id_rsa`

2. `git init`
3. `git remote add origin git@github.com:timnolte/.shell.git`
4. `GIT_SSH_COMMAND="ssh -i ~/.ssh/timnolte_id_rsa" git fetch`
5. Backup Current Home
   - `mkdir backup`
   - `cp -R .* ./backup/`
6. `git checkout master`
8. `mkdir workspace`

### Setup Development Shell

1. `~/.config/dev-shell/setup.sh`


## Build & Install Python 3.7

### Remove Python 3.5

`sudo apt remove python3.5`

> Note: software-properties-common & unattended-upgrades packages are also removed and may cause unknown issues at this time.

### Install Required Dependancies
```shel
sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev
sudo apt install libsqlite3-dev llvm libncurses5-dev libncursesw5-dev
sudo apt install xz-utils tk-dev libgdbm-dev liblzma-dev uuid-dev
```
### Download Source & Build Python 3.7

1. `cd workspace`
2. `wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz`
3. `tar -xzvf Python-3.7.3.tgz`
4. `./configure --enable-optimizations --with-ensurepip=install`
5. `make -j8`
6. `sudo make install`


### Setup Python & pip 3.7 as Default Python & Python 3
```shell
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 27
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 37
sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.7 37
sudo update-alternatives --install /usr/bin/python3m-config python3-config /usr/local/bin/python3.7-config 37
sudo update-alternatives --install /usr/bin/python3m python3m /usr/local/bin/python3.7m 37
sudo update-alternatives --install /usr/bin/python3m-config python3m-config /usr/local/bin/python3.7m-config 37
sudo mv /usr/bin/pip /usr/bin/pip.bak
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip2 27
sudo update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.7 37
sudo update-alternatives --install /usr/bin/pip3 pip3 /usr/local/bin/pip3.7 37
```

## Build & Install NodeJS 10 & NPM

1. `cd workspace/`
2. `curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -`
3. `sudo apt-get install -y nodejs`


## Build & Install Neovim

### Install Required Dependancies

sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip xsel

### Checkout and Build Neovim

1. `cd workspace/`
2. `git clone git@github.com:neovim/neovim.git`
3. `cd neovim`
4. `git checkout v<latest version tag>`
5. `make CMAKE_BUILD_TYPE=Release`
6. `sudo make install`

### Setup Neovim as Default Editor
```shell
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
```
### Setup Neovim as IDE

1. `cd workspace/`
2. `git clone git@github.com:timnolte/neovim-ide-setup.git`
3. `cd neovim-ide-setup`
4. `./setup.sh`
5. `sudo pip2 install --upgrade neovim`
6. `sudo pip3 install --upgrade neovim`
7. `sudo gem install neovim`
8. `sudo npm install -g neovim`
9. `nvim`
10. `:PlugUpdate`
11. `:UpdateRemotePlugins`


## MariaDB Setup
*Default install instructions after package has been installed*
```
To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
To do so, start the server, then issue the following commands:

'/usr/bin/mysqladmin' -u root password 'new-password'
'/usr/bin/mysqladmin' -u root -h localhost password 'new-password'

Alternatively you can run:
'/usr/bin/mysql_secure_installation'

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the MariaDB Knowledgebase at http://mariadb.com/kb or the
MySQL manual for more instructions.

You can start the MariaDB daemon with:
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'

Please report any problems at http://mariadb.org/jira

The latest information about MariaDB is available at http://mariadb.org/.
You can find additional information about the MySQL part at:
http://dev.mysql.com
Consider joining MariaDB's strong and vibrant community:
https://mariadb.org/get-involved/
```
