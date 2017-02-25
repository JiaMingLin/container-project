FROM ubuntu:14.04
MAINTAINER robin robin890650@gmail.com

ADD r_key.txt /r_key.txt
# R install
RUN sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
    gpg --import /r_key.txt && \
    gpg -a --export E084DAB9 | sudo apt-key add - && \
    sudo apt-get update && \
    sudo apt-get -y install r-base

# python install
RUN apt-get update && \
    apt-get install software-properties-common -y --force-yes && \
    add-apt-repository ppa:fkrull/deadsnakes && \
    apt-get install git vim g++ libopenblas-dev python-pandas python-numpy python-scipy python-pip libatlas-base-dev gfortran python-dev python-matplotlib -y --force-yes && \
    pip install scikit-learn
