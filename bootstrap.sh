#!/bin/bash

: ${DERBY_INSTALL:=/usr/local/derby}

su - hduser -c "/usr/loal/oozie/bin/oozie-setup.sh prepare-war"
su - hduser -c "/usr/local/oozie/bin/oozied.sh run"


if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi


