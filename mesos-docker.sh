#!/usr/bin/env bash

#zookeeper
docker run -d --net=host --name zookeeper netflixoss/exhibitor:1.5.2

#mesos-master
docker run -d --net=host --name mesos-master\
  -e MESOS_PORT=5050 \
  -e MESOS_ZK=zk://127.0.0.1:2181/mesos \
  -e MESOS_QUORUM=1 \
  -e MESOS_CLUSTER=Tester \
  -e MESOS_LOG_DIR=/var/log/mesos \
  -e MESOS_WORK_DIR=/var/tmp/mesos \
  -v "$(pwd)/log/mesos:/var/log/mesos" \
  -v "$(pwd)/tmp/mesos:/var/tmp/mesos" \
   mesosphere/mesos-master:1.5.3-rc1

#mesos-agent
docker run -d --net=host --privileged --name mesos-slave \
  -e MESOS_PORT=5051 \
  -e MESOS_MASTER=zk://127.0.0.1:2181/mesos \
  -e MESOS_SWITCH_USER=0 \
  -e MESOS_CONTAINERIZERS=docker,mesos \
  -e MESOS_LOG_DIR=/var/log/mesos \
  -e MESOS_WORK_DIR=/var/tmp/mesos \
  -e MESOS_SYSTEMD_ENABLE_SUPPORT="false" \
  -v "$(pwd)/log/mesos:/var/log/mesos" \
  -v "$(pwd)/tmp/mesos:/var/tmp/mesos" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /sys/fs/cgroup:/cgroup \
  -v /sys:/sys \
  -v /usr/bin/docker:/usr/bin/docker \
  mesosphere/mesos-slave:1.5.3-rc1
