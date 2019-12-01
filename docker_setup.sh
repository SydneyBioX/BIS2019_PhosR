#!/bin/bash
sudo apt-get update
sudo apt-get -y install r-cran-rgl
sudo apt-get -y install xorg 
sudo apt-get -y install libx11-dev 
sudo apt-get -y install libglu1-mesa-dev 
sudo apt-get -y install libfreetype6-dev

## Make a tmp folder and git clone
## All git files will then be copied to /home/SingleCellPlus/
mkdir /home/gittmp/
git clone https://github.com/SydneyBioX/BIS2019_PhosR /home/gittmp/


sudo groupadd trainees

for((userIndex = 1; userIndex <= 60; userIndex++))
  do
{
  userID=user${userIndex}
  sudo useradd -g trainees -d /home/$userID -m -s /bin/bash $userID
  sudo cp -r /home/gittmp/* /home/$userID/
  echo $userID:2019 | sudo chpasswd
}
done