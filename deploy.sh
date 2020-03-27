#!/bin/bash
webap=$1
#cd ../dev_application
tar -zcvf ../dev_application/myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
chown jenkins:jenkins ../dev_application/myApp_*
chmod 766 ../dev_application/myApp_*
cp -r ../dev_application/myApp_* ../../release
