FROM bioconductor/release_base2:R.3.6.1_Bioc3.10

MAINTAINER kevin.wang@sydney.edu.au

## R package installation scripts
ADD install.R /home/ 

## Setup folder structure
ADD docker_setup.sh /home/

## Set up data and teaching materials
RUN bash /home/docker_setup.sh 

## Install all R packages
RUN R -f /home/install.R
