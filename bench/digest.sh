#!/bin/bash
outfile=./digest/out_`date +"%Y%m%d_%H%M%S"`.txt
echo $outfile
sudo pt-query-digest \
        /var/log/mysql/mysql-slow.log > $outfile 
