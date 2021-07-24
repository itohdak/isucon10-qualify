#!/bin/bash

docker-compose -f ../webapp/docker-compose/go.yaml down -v
echo waiting for shutting down docker-compose
sleep 5
sudo systemctl restart isuumo.go
./reset_mysql_for_bench.sh
echo waiting for restarting mysql
sleep 10
./bench
