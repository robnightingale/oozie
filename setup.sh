#!/bin/bash

#Install Oozie
wget "$REPOSITORY_HOST"/repo/oozie-4.3.0.tar.gz
tar -xzvf oozie-4.3.0.tar.gz
mv /usr/local/oozie-4.3.0 /usr/local/oozie
rm -rf /usr/local/oozie-4.3.0.tar.gz
chown -R hduser:hadoop /usr/local/oozie

cp /container/oozie-site.xml /usr/local/oozie/conf/oozie-site.xml
cp /container/adminusers.txt /usr/local/oozie/conf/adminusers.txt

chown -R hduser:hadoop /usr/local/oozie/libext

