#!/usr/bin/env bash

# Generate random UUIDs for the cluster
CLUSTER_ID=$(kafka-storage random-uuid)

# Create folders
mkdir -p /tmp/controller/data
mkdir -p /tmp/var/lib/kafka/1/data
mkdir -p /tmp/var/lib/kafka/2/data

# Format folders
kafka-storage format -t $CLUSTER_ID -c controller.properties
kafka-storage format -t $CLUSTER_ID -c server.1.properties
kafka-storage format -t $CLUSTER_ID -c server.2.properties

# Start KRaft 
kafka-server-start controller.properties > logs/controller.log 2>&1 &

# Start Brokers
kafka-server-start server.1.properties > logs/broker.1.log 2>&1 &
kafka-server-start server.2.properties > logs/broker.2.log 2>&1 &