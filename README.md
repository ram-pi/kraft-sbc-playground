# SBC Demo for KRaft powered Kafka Clusters

## Start

```
./up.sh
```

## SBC

### Enable SBC

```
kafka-configs --bootstrap-server localhost:9092,localhost:19092 --entity-type brokers --entity-default --alter --add-config "confluent.balancer.enable=true" --command-config client.properties
kafka-configs --bootstrap-server localhost:9092,localhost:19092 --entity-type brokers --entity-default --alter --add-config "confluent.balancer.heal.uneven.load.trigger=ANY_UNEVEN_LOAD" --command-config client.properties
```

### Check Status

```
kafka-rebalance-cluster --bootstrap-server localhost:9092,localhost:19092 --command-config client.properties --status
```

## Teardown

```
./teardown.sh
```
