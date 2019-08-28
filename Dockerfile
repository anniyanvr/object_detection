# set the base image to Ubuntu 14.04
FROM ubuntu:14.04 

# file Author / Maintainer to ShwethaS
MAINTAINER shwethasrinivasan97@gmail.com

# file adding auser "docker" 
# -m : home directory
# -s : shell (user's login shell)
RUN useradd -ms /bin/bash docker

RUN su docker

# Setting the path for the installation directory
RUN export DATE_LOG=`echo $(date "+%Y%m%d-%H%M%S")`
ENV LOG_DIR_DOCKER="/root/DockerLogs"   
ENV LOG_INSTALL_DOCKER="/root/DockerLogs/$(DATE_LOG)-gsd-install.log"

RUN echo "PATH="$LOG_DIR_DOCKER   \
   &&  mkdir -p $LOG_DIR_DOCKER   \
   &&  touch ${LOG_INSTALL_DOCKER}   \
   &&  ls ${LOG_INSTALL_DOCKER}   \
   &&  echo "Logs directory and file created"  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}    

# update the repository sources list
RUN apt-get update  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}

# install nginx
# add all the repositories (nginx, etc)
RUN apt-get install -y python-software-properties  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}   \
    &&  apt-get install -y software-properties-common python-software-properties  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}   \
    &&  add-apt-repository -y ppa:nginx/stable  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}   \
    &&  add-apt-repository -y ppa:mc3man/trusty-media  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}   \
    && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

#RUN apt install -y nginx \
 #&& apt-get install -y ufw 
 #&& ufw allow 'Nginx HTTP'

# update the keys and repository sources list
RUN apt-key update && apt-get update  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}

#installing python and dependencies
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

#installing systemd for nginx checks
RUN apt-get install -y systemd

#RUN echo "EXPOSE  22  25  443  80  8000  1025  143  587"  | sed -e "s/^/$(date +%Y%m%d-%H%M%S) :  /" 2>&1 | tee -a ${LOG_INSTALL_DOCKER}
#EXPOSE  22  25  443  80  8000  1025  143  587  27017 5555 8081

WORKDIR /etc/nginx

#CMD systemctl start nginx  
CMD ["nginx"]

EXPOSE 80 443
