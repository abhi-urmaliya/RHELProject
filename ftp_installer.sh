zenity --question --title="Server Creation Utility" --text="Do you want to setup FTP server?"
if [ $? -eq 0 ]
then
yum install vsftpd*
cp -vf /etc/vsftpd/vsftpd.conf /root/Documents/backup/vsftpd.conf
rm -vf /etc/vsftpd/vsftpd.conf
printf "anonymous_enable=YES\nlocal_enable=YES\nwrite_enable=YES\nlocal_umask=022\nanon_upload_enable=YES\nanon_mkdir_write_enable=YES\ndirmessage_enable=YES\nxferlog_enable=YES\nconnect_from_port_20=YES\nxferlog_std_format=YES\nftpd_banner=Welcome to FTP service\nlisten=YES\npam_service_name=vsftpd\nuserlist_enable=YES\ntcp_wrappers=YES" >> /etc/vsftpd/vsftpd.conf
service vsftpd restart
zenity --info --title="Server Creation Utility" --text="FTP Server is up!" --width=250
logger "Server Creation Utility FTP Installation complete"
else
zenity --info --title="Server Creation Utility" --text="Task Aborted!" --width=250
fi
logger "Server Creation Utility FTP Installation exited"
./main_menu.sh