a=$(zenity --list --title="Server Creation Utility" --text="Select the server you want to setup - " --radiolist --column="" --column="Server List" FALSE Telnet FALSE SSH FALSE FTP FALSE YUM --height=230)
if [ $? -eq 0 ]
then
if [ $a = Telnet ]
then logger "Server Creation Utility Telnet Installation initiated" ; ./telnet.sh
fi
if [ $a = SSH ]
then logger "Server Creation Utility SSH Installation initiated" ; ./ssh.sh
fi
if [ $a = FTP ]
then logger "Server Creation Utility FTP Installation initiated" ; ./ftp_installer.sh
fi
if [ $a = YUM ]
then logger "Server Creation Utility YUM Installation initiated" ; ./yum_installer.sh
fi
else
logger "Server Creation Utility Installation service exited" ; zenity --info --title="Server Creation Utility" --text="Task Aborted!" --width=250
fi
./main_menu.sh