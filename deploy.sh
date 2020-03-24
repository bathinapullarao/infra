#!/bin/bh
ls -l
tar -zcvf ../CRM/myApp_$(date +%Y%d%m)_buildnum_$buildno.tar.gz *
