#!/bin/bash
cd CRM
tar -zcvf myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
cp -r myApp_* ../../release
