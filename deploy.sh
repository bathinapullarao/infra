#!/bin/bash
webap=$1
#cd ../dev_application
tar -zcvf ../dev_application/myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
chown jenkins:jenkins myApp_*
chmod 766 myApp_*
cp -r myApp_* ../../release
