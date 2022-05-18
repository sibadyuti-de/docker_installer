#!/bin/bash

file="docker.repo basic.repo"
filepath="/etc/yum.repos.d/"
cp -d $file $filepath ;
echo -e "\nfile copyied\n"
# check network is connected or not if connected install some rpm packages used to install docker dependencys.
if ping -c 1 -q goo.gl >&/dev/null; then
echo -e "Downloading Docker Repos\n"
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y>&/dev/null; 
 echo -e "Complete\n"
while echo -e "Downloading additional files\n"
do
 echo -e "Connectiong To The Server\n" ;
 sleep 2s
 echo -e "Downloading Docker-ce\n"
  break
done 
# install docker-ce after copying url of yum docker.repo and if error happen you can check log.txt or seen in the terminal.
 if yum install docker-ce --nobest -y >log.txt&& >&/dev/null;
 then 
 echo -e "Requirement Already Satisfied / Downloaded\n" 
 echo -e "Starting Docker\n"
 systemctl restart docker
 fi
 # check ubuntu is installed in your system or not if installed than run the ubuntu or it install ubuntu latest.
 if docker images | grep ubuntu >&/dev/null;
 then 
 while true; do
    read -p "Do you want to run ubuntu now? [y/n]" yn
    case $yn in
        [y]* ) docker run -dit --name doker_installer ubuntu; break;;
        [n]* ) echo -e "\nHave a Good Day\n"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
 done
 elif docker pull ubuntu
 then 
 echo "Downloading ubuntu Complete Starting" 
 while true; do
    read -p "Do you want to run ubuntu now?" yn
    case $yn in
        [y]* ) docker run -dit --name doker_installer ubuntu; break;;
        [n]* ) echo -e "\nHave a Good Day\n"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
 done
 elif echo -e "Downloading & installing Docker ..... Please Wait .....\n"
 then
 echo -e "Downloaded\n"
 fi
docker attach doker_installer
echo -e "\nHave a Good Day\n" 
# if internet is not available than exit.
else 
echo -e "Internet is not Available ,Please Connect To The Internet\n"
sleep 2s 
fi 
