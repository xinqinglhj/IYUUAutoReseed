#!/bin/sh
DEFAULT_CRON="9 */6 * * *"
cron=${cron:-$DEFAULT_CRON}
set -e
echo "$cron /usr/bin/php /IYUU/iyuu.php" | crontab -
cd /IYUU && git fetch --all && git reset --hard origin/master
/usr/bin/php /IYUU/iyuu.php
/usr/sbin/crond -f
