zenity --question --title="Server Creation Utility" --text="Do you want to setup SSH server?"
if [ $? -eq 0 ]
then service sshd restart
zenity --info --title="Server Creation Utility" --text="SSH Server is up!" --width=250
logger "Server Creation Utility SSH Installation complete"
else
zenity --info --title="SSH Server Creation Utility" --text="Task Aborted!" --width=250
fi
logger "Server Creation Utility SSH Installation exited"
./main_menu.sh