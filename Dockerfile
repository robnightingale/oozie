FROM master.cloud.com:5000/hadoop
MAINTAINER Sumit Kumar Maji

RUN apt-get update \
        && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends \
        zip unzip \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD . /container/
WORKDIR /usr/local/
ARG REPOSITORY_HOST

RUN /container/setup.sh

RUN echo 'cd /usr/local/oozie/bin' >> /home/hduser/.bashrc
RUN echo 'echo "1. Run => ./oozie-setup.sh prepare-war"' >> /home/hduser/.bashrc
RUN echo 'echo "2. Run => ./oozie-setup.sh sharelib create -fs hdfs://<namenode>:8020"' >> /home/hduser/.bashrc
RUN echo 'echo "3. Run => ./oozied.sh run"' >> /home/hduser/.bashrc

#Expose Oozie port 11000
EXPOSE 11000

#Expose other ports
EXPOSE 49707 22 2122
CMD /usr/sbin/sshd -D

