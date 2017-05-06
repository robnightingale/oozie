#!/bin/bash

#Install Oozie
tar -xzvf /container/oozie-4.3.0.tar.gz -C /usr/local/
mv /usr/local/oozie-4.3.0 /usr/local/oozie
rm -rf /container/oozie-4.3.0.tar.gz
chown -R hduser:hadoop /usr/local/oozie

cp /container/oozie-site.xml /usr/local/oozie/conf/oozie-site.xml
cp /container/adminusers.txt /usr/local/oozie/conf/adminusers.txt



echo 'cd /usr/local/oozie/bin' >> /home/hduser/.bashrc
echo 'echo "1. Run => ./oozie-setup.sh prepare-war"' >> /home/hduser/.bashrc
echo 'echo "2. Run => ./oozie-setup.sh sharelib create -fs hdfs://<namenode>:54310"' >> /home/hduser/.bashrc
echo 'echo "3. Run => ./oozied.sh run"' >> /home/hduser/.bashrc

chown -R hduser:hadoop /usr/local/oozie/libext

