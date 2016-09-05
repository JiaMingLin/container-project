FROM ubuntu:14.04
MAINTAINER robin robin890650@gmail.com

# install python dep
RUN apt-get update && \
    apt-get install software-properties-common -y --force-yes

RUN add-apt-repository ppa:fkrull/deadsnakes && \
    apt-get update && \
    apt-get dist-upgrade -y --force-yes && \
    apt-get install python3.4 && \
    apt-get install git g++ libopenblas-dev python-numpy python-scipy python-pip libatlas-base-dev gfortran python-dev python-matplotlib python3-pip -y --force-yes

RUN pip3 install -U pandas numpy scikit-learn && \
    pip3 install jupyter Theano

RUN jupyter notebook --generate-config && \
    echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py

ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/home/notebook/"]
WORKDIR /home/

EXPOSE 8888
#ENTRYPOINT ["/start.sh"]
