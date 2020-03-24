#!/bin/bash
webap=$1
cd CRM
tar -zcvf myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
mv myApp_* ../../release
cd ~/key
ssh -i id_rsa $webap "sudo mkdir -p /usr/local/myApp"
