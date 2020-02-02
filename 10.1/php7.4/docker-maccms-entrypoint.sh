#!/bin/sh
set -e

if [ -f /var/www/html/admin.php ] && [ $MACCMS_ADMIN_FILENAME ]; then 
  echo "Rename file admin.php to ${MACCMS_ADMIN_FILENAME}"
  mv /var/www/html/admin.php \
  "/var/www/html/${MACCMS_ADMIN_FILENAME}"; \
  cat > /var/www/html/maccms-config.php <<EOF 
<?php
define('ADMIN_FILENAME','$MACCMS_ADMIN_FILENAME');
EOF
fi
source docker-php-entrypoint