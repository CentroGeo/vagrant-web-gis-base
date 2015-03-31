#!/bin/bash

# Script to set up dependencies for Django on Vagrant.

PGSQL_VERSION=9.3

# Need to fix locale so that Postgres creates databases in UTF-8
#cp -p /vagrant_data/etc-bash.bashrc /etc/bash.bashrc
locale-gen en_US.UTF-8
dpkg-reconfigure locales

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Install essential packages from Apt
# Postgresql
apt-get update
if ! command -v psql; then
    apt-get install -y postgresql-$PGSQL_VERSION libpq-dev
    cp /vagrant/install_data/pg_hba.conf /etc/postgresql/$PGSQL_VERSION/main/
    cp /vagrant/install_data/postgresql.conf /etc/postgresql/$PGSQL_VERSION/main/
    service postgresql restart
fi
#Password para el usuario postgres
sudo -u postgres psql postgres -d postgres -c "ALTER USER postgres with password 'postgres';"
#Repositorio para PostGis, node y sus dependencias
# add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
# sudo add-apt-repository -y ppa:chris-lea/node.js
# apt-get install -y nodejs
# # Python dev packages
# apt-get install -y build-essential python python-dev python-setuptools python-pip
# # Dependencies for image processing with Pillow (drop-in replacement for PIL)
# # supporting: jpeg, tiff, png, freetype, littlecms
# apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev
# # Git (we'd rather avoid people keeping credentials for git commits in the repo, but sometimes we need it for pip requirements that aren't in PyPI)
# apt-get install -y git
# apt-get install -y



#PostGis
# apt-get install -y postgresql-server-dev-all
# apt-get install -y postgresql-$PGSQL_VERSION-postgis-2.1
# sudo -u postgres createdb postgis-template
# sudo -u postgres psql -d postgis-template -c "create extension postgis;"
# # virtualenv global setup
# if ! command -v pip; then
#     easy_install -U pip
# fi


# install django:
apt-get install -y python3-pip
pip3 install django



# Cleanup
apt-get clean

echo "Zeroing free space to improve compression."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
