#!/usr/bin/env bash

# find pid using jps
jps -l | grep kafka.Kafka | awk '{print $1}' | xargs kill -9

sleep 5

# Cleanup
rm -fr /tmp/controller/data
rm -fr /tmp/var/lib/kafka/1/data
rm -fr /tmp/var/lib/kafka/2/data