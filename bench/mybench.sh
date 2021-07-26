#!/bin/bash

sudo systemctl stop isuumo.go
./reset_server_for_bench.sh
sleep 30
./bench --target-url http://localhost:8080
