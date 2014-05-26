zenity --question --title="Server Creation Utility" --text="Do you want to setup Telnet server?"
if [ $? -eq 0 ]
then yum install xinetd*
if [ $? -eq 0 ]
then yum install telnet
if [ $? -eq 0 ]
then rm -rf /etc/xinetd.d/telnet
printf "service telnet \n{ \n\tflags = REUSE \n\tsocket_type = STREAM \n\twait = no \n\tuser = root \n\tserver = /usr/sbin/in.telnetd \n\tlog_on_failure += USERID \n\tdisabled = no \n}" >> /etc/xinetd.d/telnet
service xinetd restart
logger "Server Creation Utility Telnet Installation complete"
zenity --info --title="Server Installation Creation Utility" --text="Telnet Server is up!" --width=250
fi
fi
else
zenity --info --title="Telnet Server Creation Utility" --text="Task Aborted!" --width=250
fi
logger "Server Creation Utility Telnet Installation exited"
./main_menu.sh