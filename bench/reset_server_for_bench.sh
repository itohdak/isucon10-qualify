#!/bin/bash
sudo mv -f ../webapp/logs/nginx/access.log ../webapp/logs/nginx/access.log.back
sudo rm -f ../webapp/logs/nginx/access.log
cd ../webapp/
rm -f nohup.out
nohup make isuumo/go &
