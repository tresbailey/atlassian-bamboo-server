#!/bin/bash

/etc/init.d/bamboo start

tail -f /var/log/bamboo.log
