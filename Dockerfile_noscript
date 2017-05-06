FROM sumit/hadoop:latest
MAINTAINER Sumit Kumar Maji


#Install Oozie
COPY oozie-4.3.0.tar.gz /usr/local/oozie-4.3.0.tar.gz
RUN tar -xzvf /usr/local/oozie-4.3.0.tar.gz -C /usr/local/
RUN mv /usr/local/oozie-4.3.0 /usr/local/oozie
RUN rm -rf /usr/local/oozie-4.3.0.tar.gz
#RUN chown -R hduser:hadoop /usr/local/oozie

COPY oozie-site.xml /usr/local/oozie/conf/oozie-site.xml
COPY adminusers.txt /usr/local/oozie/conf/adminusers.txt



RUN echo 'cd /usr/local/oozie/bin' >> /home/hduser/.bashrc
RUN echo 'echo "1. Run => ./oozie-setup.sh prepare-war"' >> /home/hduser/.bashrc
RUN echo 'echo "2. Run => ./oozie-setup.sh sharelib create -fs hdfs://<namenode>:54310"' >> /home/hduser/.bashrc
RUN echo 'echo "3. Run => ./oozied.sh run"' >> /home/hduser/.bashrc


RUN apt-get install -yq zip unzip
RUN chown -R hduser:hadoop /usr/local/oozie/libext
#Expose Oozie port 11000
EXPOSE 11000

#Expose other ports
EXPOSE 49707 22 2122
CMD /usr/sbin/sshd -D

