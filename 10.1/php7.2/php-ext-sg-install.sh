#!/bin/sh
set -e
mkdir -p /tmp/sg-loaders &&\
cd /tmp/sg-loaders
wget http://cdn.esiran.com/loaders.linux-x86_64.tar.gz -qO - | tar -xz
phpv=$(php -v | sed -n 's/^PHP[ ]\([0-9.]*\).*/\1/p')
phpvs=$(echo $phpv | awk -F '.' '{print $1 "." $2}')
phpex=$(php -i | sed -n 's/^extension_dir.*\([^=> ]*\)*/\1/p')
sgf=$(find -name "*$phpvs.lin")
cp $sgf $phpex
cat > $PHP_INI_DIR/conf.d/docker-php-ext-sg.ini <<EOF
extension=$(echo $sgf | sed -n 's/\.\/\(.*\)$/\1/p')
EOF
