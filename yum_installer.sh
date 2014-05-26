zenity --question --title="Server Creation Utility" --text="Do you want to setup YUM server?"
if [ $? -eq 0 ]
then
zenity --info --title="Server Creation Utility" --text="Please make sure your RHEL 6 Eneterprise DVD is mounted on /media!" --width=250
cp -rvf /media/RHEL_6.2\ x86_64\ Disc\ 1/Packages /Packs
cd /Packs
rpm -ivh deltarpm-3.5-0.5.20090913git.el6.x86_64.rpm python-deltarpm-3.5-0.5.20090913git.el6.x86_64.rpm createrepo-0.9.8-4.el6.noarch.rpm
printf "[Packs]\nname=Packs\nbaseurl=file:///Packs\nenabled=1\ngpgcheck=0" >> /etc/yum.repos.d/packs.repo
cd /Packs
createrepo /Packs
yum clean all
yum list all
zenity --info --title="Server Creation Utility" --text="YUM Server is up!" --width=250
logger "Server Creation Utility YUM Installation complete"
else
zenity --info --title="Server Creation Utility" --text="Task Aborted!" --width=250
fi
logger "Server Creation Utility YUM Installation exited"
./main_menu.sh