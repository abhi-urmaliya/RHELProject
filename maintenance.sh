a=$(zenity --list --title="Server Creation Utility" --text="Select the schedule - " --radiolist --column="" --column="Options" FALSE Hourly FALSE Daily FALSE Monthly FALSE Custom --height=220 --width=250)
if [ $? -eq 0 ]
then zenity --info --title="Server Creation Utility" --text="Enter the script in the vi editor window that follows. Remember to save your script!" --width=250
if [ $a = Hourly ]
then vi /etc/cron.hourly/hourly_job.sh
logger "Server Creation Utility Hourly job setup"
fi
if [ $a = Daily ]
then vi /etc/cron.daily/daily_job.sh
logger "Server Creation Utility Daily job setup"
fi
if [ $a = Weekly ]
then vi /etc/cron.weekly/weekly_job.sh
logger "Server Creation Utility Weekly job setup"
fi
if [ $a = Monthly ]
then vi /etc/cron.monthly/monthly_job.sh
logger "Server Creation Utility Monthly job setup"
fi
if [ $a = Custom ]
then zenity --info --title="Server Creation Utility" --text="Opening crontab file. Please refer online documentation for usage!" --width=250
crontab -e
logger "Server Creation Utility Custom job setup"
fi
else
zenity --info --title="Server Creation Utility" --text="Task Aborted!" --width=250
fi
service crond restart
logger "Server Creation Utility Maintenance exited"
./main_menu.sh