#!/bin/bash
webap=$1
cd ../dev_application
ls -l
tar -zcvf myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
chown jenkins:jenkins myApp_*
mv myApp_* ../../release
