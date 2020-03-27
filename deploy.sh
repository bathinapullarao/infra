#!/bin/bash
webap=$1
cd ../dev_application
ls -l
sudo tar -zcvf myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
sudo chown jenkins:jenkins myApp_*
sudo mv myApp_* ../../release
