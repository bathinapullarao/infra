#!/bin/bash
webap=$1
cd CRM
tar -zcvf myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
mv myApp_* ../../release
cd ~/ssh
ssh -i devops_bpr.pem devops_bpr@$webap "sudo mkdir -p /usr/local/myApp"
ls -l
