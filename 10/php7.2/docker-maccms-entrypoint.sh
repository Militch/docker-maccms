#!/bin/sh
set -e

if [ -f /var/www/html/admin.php ] && [ $MACCMS_ADMIN_FILENAME ]; then 
  echo "Rename file admin.php to ${MACCMS_ADMIN_FILENAME}"
  mv /var/www/html/admin.php \
  "/var/www/html/${MACCMS_ADMIN_FILENAME}"
fi
source docker-php-entrypoint