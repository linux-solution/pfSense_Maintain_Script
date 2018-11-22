#!/usr/local/bin/bash

# For re-install case
./uninstall.sh

# Install shell script files into /etc/
tar -xf scripts.tar.gz
mv ./scripts/* /etc/
rm  -rf ./scripts/

# Add Cron Job
crontab -l > myCronjob
echo "* * * * * /etc/./add_ovpn_tbl.sh" >> myCronjob
echo "* * * * * /etc/./clear_snort_blist.sh" >> myCronjob
echo "1 6 * * * /etc/./cleanup_newday.sh" >> myCronjob
crontab myCronjob
rm -rf myCronjob