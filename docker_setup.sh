#!/bin/bash
sudo apt-get update

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