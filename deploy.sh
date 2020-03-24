#!/bin/bash
cd CRM
sudo tar -zcvf myApp_$(date +%Y%d%m)_buildnum_buildno.tar.gz *
#sudo cp -r myApp_* ../../release
