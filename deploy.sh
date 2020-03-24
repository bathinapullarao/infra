#!/bin/bh
ls -l
tar -zcvf myApp/myApp_$(date +%Y%d%m)_buildnum_$buildno.tar.gz *
