# Crostini Development Setup

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
7. `mkdir workspace`

### Setup Development Shell

```bash
$ ~/.config/dev-shell/setup.sh`
```

## Install Required Packages

```bash
$ sudo apt install net-tools tree wget curl procps mlocate man gettext \
 ccrypt gnupg2 gnupg-agent \
 grep bash-completion \
 git subversion php-cli python python-pip python-dev \
 python3 python3-pip python3-dev ruby ruby-dev golang make \
 ninja-build gettext libtool libtool-bin autoconf automake cmake \
 g++ pkg-config unzip xsel editorconfig gdb \
 rclone \
 software-properties-common \
 python-pip python-setuptools python-setuptools-git \
 ca-certificates apt-transport-https \
 snapd \
 build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
 libsqlite3-dev llvm libncurses5-dev libncursesw5-dev \
 xz-utils tk-dev libgdbm-dev liblzma-dev uuid-dev \
 libnotify4 libnspr4 libnss3 libxkbfile1 libsecret-common libsecret-1-0
```

## Install Snap Package Management

### Install Required Packages for Snap

```bash
$ sudo apt install fuse2 squashfs-tools libfuse-dev libattr1 libattr1-dev \
 zlib1g zlib1g-dev udev
```

### Build & Install squashfs

1. `./autogen.sh`
2. `./configure`
3. `make`
4. `sudo make install`
5. `sudo ldconfig`

### System Permissions Fix for Snap

```bash
$ sudo chmod 755 /
```

## Python Configuration

### Setup Python & pip 3.7 as Default Python & Python 3

```bash
$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 27
$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.7 37
$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 37
$ sudo update-alternatives --install /usr/bin/python3m-config python3-config /usr/local/bin/python3.7-config 37
$ sudo update-alternatives --install /usr/bin/python3m python3m /usr/local/bin/python3.7m 37
$ sudo update-alternatives --install /usr/bin/python3m-config python3m-config /usr/local/bin/python3.7m-config 37
$ sudo mv /usr/bin/pip /usr/bin/pip.bak
$ sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip2 27
$ sudo update-alternatives --install /usr/bin/pip3 pip3 /usr/local/bin/pip3.7 37
$ sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 37
```

## Build & Install NodeJS 10 & NPM

> Instead of installing a system package it is more flexible to install NVM and use a user-based NodeJS/NPM.

1. `cd workspace/`
2. `mkdir ~/.nvm`
3. `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash`

### Build & Install Shell NPM Dependencies

```bash
$ npm install
```

## Build & Install Neovim

### Install Required Dependancies

```bash
$ sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip xsel editorconfig
```

### Checkout and Build Neovim

1. `cd workspace/`
2. `git clone git@github.com:neovim/neovim.git`
3. `cd neovim`
4. `git checkout v<latest version tag>`
5. `make CMAKE_BUILD_TYPE=Release`
6. `sudo make install`

### Setup Neovim as Default Editor

> NOTE: For a user-managed configuration add items to `.bash_aliases` instead of changing the system defaults.

#### User Only

```shell
# vim && neovim
# clean the vim swap file
alias nvimc='rm -I ~/nvim/swap/*'
alias nvimcu='rm -I ~/nvim/undo/*'
alias vim='nvim'
alias vi='nvim'
alias editor='nvim'
alias vimdiff='nvim -d'
```

#### System Wide

```bash
$ sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
```

### Setup Neovim as IDE

1. `cd workspace/`
2. `git clone git@github.com:timnolte/neovim-ide-setup.git`
3. `cd neovim-ide-setup`
4. `./setup.sh`
5. `sudo pip2 install --upgrade neovim`
6. `sudo pip3 install --upgrade neovim`
7. `sudo gem install neovim`
8. `npm install -g neovim`
9. `nvim`
10. `:PlugUpdate`
11. `:UpdateRemotePlugins`


## Install GUI IDEs

### Install Visual Studio Code

#### Debian Package Method

##### Download and Install Package

1. `curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > ~/.tmp/vscode.deb`
2. `sudo dpkg -i ~/.tmp/vscode.deb`

### Install PhpStorm

#### Snap Package Method

1. `sudo snap install phpstorm --classic`

