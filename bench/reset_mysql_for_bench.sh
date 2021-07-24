#!/bin/bash
set -e
sudo rm -f /var/log/mysql/mysql-slow.log
sudo systemctl restart mysql
