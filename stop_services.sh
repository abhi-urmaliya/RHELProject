a=$(zenity --list --title="Server Creation Utility" --text="Select the service to shut down - " --radiolist --column="" --column="Services List" FALSE SQUID FALSE DHCP FALSE DNS FALSE NFS FALSE SAMBA FALSE APACHE FALSE FTP FALSE TELNET FALSE SSH --height=405)
if [ $? -eq 0 ]
then
if [ $a = SQUID ]
then service squid stop ; logger "Server Creation Utility Squid Server stopped"
fi
if [ $a = DHCP ]
then service dhcpd stop ; logger "Server Creation Utility DHCP Server stopped"
fi
if [ $a = DNS ]
then service named stop ; logger "Server Creation Utility DNS Server stopped"
fi
if [ $a = NFS ]
then service nfs stop ; logger "Server Creation Utility NFS Server stopped"
fi
if [ $a = SAMBA ]
then service nmb stop ; service smb stop ; logger "Server Creation Utility SAMBA Server stopped"
fi
if [ $a = APACHE ]
then service httpd stop ; logger "Server Creation Utility HTTP Server stopped"
fi
if [ $a = FTP ]
then service vsftpd stop ; logger "Server Creation Utility FTP Server stopped"
fi
if [ $a = TELNET ]
then service telnet stop ; logger "Server Creation Utility Telnet Server stopped"
fi
if [ $a = SSH ]
then service sshd stop ; logger "Server Creation Utility SSH Server stopped"
fi
else
zenity --info --title="Server Creation Utility" --text="Task Aborted!" --width=250
fi
logger "Server Creation Utility Stop Service exited"
./main_menu.sh