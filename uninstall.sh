#!/usr/local/bin/bash

# Remove related Cron jobs from Crontab
touch myCronjob
touch myNewCronjob

crontab -l > myCronjob

pattern1='*add_ovpn_tbl*'
pattern2='*clear_snort_blist*'
pattern3='*cleanup_newday*'

while read CronJobList; do
	case $CronJobList in
		$pattern1) continue;;
		$pattern2) continue;;
		$pattern3) continue;;
	esac

	echo "$CronJobList" >> myNewCronjob
done < "myCronjob"

crontab myNewCronjob

rm -rf myCronjob
rm -rf myNewCronjob

# Remove scripts.
rm -rf /etc/add_ovpn_tbl.sh
rm -rf /etc/clear_snort_blist.sh
rm -rf /etc/cleanup_newday.sh

# Remove tables.
rm -rf /etc/Cleared_Blocked_IP.tbl
rm -rf /etc/OpenVPN_Client_List.tbl