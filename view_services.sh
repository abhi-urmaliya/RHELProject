rm -f running_log;
service --status-all | grep rpcbind >> running_log;
service --status-all | grep nfsd >> running_log;
service --status-all | grep smb >> running_log;
service --status-all | grep nmb >> running_log;
service --status-all | grep httpd >> running_log;
service --status-all | grep vsftpd >> running_log;
service --status-all | grep dhcpd >> running_log;
service --status-all | grep named >> running_log;
clear
zenity --info --title="Server Creation Utility" --text="`cat running_log`"
logger "Server Creation Utility View Services exited"
./main_menu.sh