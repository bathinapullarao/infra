#!/bin/bash
webap=$1
cd CRM
tar -zcvf myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
mv myApp_* ../../release
ssh $webap "sudo mkdir -p /usr/local/myApp"
ssh $webap "sudo chown -R devops_bpr:devops_bpr /usr/local/myApp"
ssh $webap "sudo rm -rf /usr/local/myApp/*"
ssh $webap "sudo mkdir -p /usr/local/backup/"
ssh $webap "sudo chown -R devops_bpr:devops_bpr /usr/local/backup"
ssh $webap "sudo rm -rf /usr/local/backup/*"
scp -r ../../myApp_* $webap:/usr/local/backup/
ssh $webap "sudo tar -zxvf /usr/local/backup/myApp_* -C /usr/local/"
