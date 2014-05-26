logger "Server Creation Utility Application Main Menu accessed"
a=$(zenity --list --title="Server Creation Utility" --text="Select from the following tasks - " --radiolist --column="" --column="Job List" FALSE Install FALSE View FALSE Stop FALSE Maintenance FALSE Logs --height=228)
if [ $? -eq 0 ]
then
if [ $a = Install ]
then ./server_creation_utility.sh ; logger "Server Creation Utility Installation Service initiated"
fi
if [ $a = View ]
then ./view_services.sh ; logger "Server Creation Utility View Service initiated"
fi
if [ $a = Stop ]
then ./stop_services.sh ; logger "Server Creation Utility Stop Service initiated"
fi
if [ $a = Maintenance ]
then ./maintenance.sh ; logger "Server Creation Utility Maintenance Service initiated"
fi
if [ $a = Logs ]
then ./view_logs.sh ; logger "Server Creation Utility Logs reviewed"
fi
else
logger "Server Creation Utility Application exited" ; zenity --info --title="Server Creation Utility" --text="Task Aborted!" --width=250
fi