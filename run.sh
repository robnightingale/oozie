#!/bin/bash

docker run -d -p 11000:11000 -v /usr/local/repository:/usr/lib/repository --name oozie -h oozie --net cloud.com sumit/oozie /etc/bootstrap.sh -d
