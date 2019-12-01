#!/bin/bash

apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    r-cran-rgl \
    xorg \
    libx11-dev \
    libglu1-mesa-dev \
    libfreetype6-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

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