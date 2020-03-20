#!/bin/bash
path='/usr/local'
app=$1
buildno=$2
#-----------------------------------------------------------------------#
#----if condition to check the parameters eq 2--------------------------#
#-remove the data in myApp and backup directorys in destination server-#
#-----------------------------------------------------------------------#
if [ "$#" -eq 2 ]; then
	ssh $app "sudo rm -rf /usr/local/myApp/*"                       
	ssh $app "sudo rm -rf /usr/local/backup/*"
	scp -r /usr/local/download/Build_$buildno/* $app:/usr/local/backup/
	ssh $app "sudo tar -zxvf /usr/local/backup/myApp_* -C /usr/local/"              
#----------------------------------------------------------------------#
#----else condition to exit when arguments not eq 2--------------------#
#----------------------------------------------------------------------#
else
        echo "Arguments are not equals to 2"
        echo "Aruments should pass in the below format"
        echo "sh deploy.sh servername buildnumber"
	echo "examle  sh fallback.sh test1 1"
	exit 1
fi

