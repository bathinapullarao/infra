#!/bin/bh
#-----------------------------------------------------------------------#
#------------------------Declare Variables------------------------------#
#-----------------------------------------------------------------------#
path='/usr/local'                                                       
webap=$1
file=$path/$2/buildno.txt
buildno=$(cat $file | awk '{printf "%s", $1}')
buildno=$((buildno+1)) 
#-----------------------------------------------------------------------#
#-----------if condition to accpet when arguments eq 2------------------#
#-----------------------------------------------------------------------#
if [ "$#" -eq 2 ]; then
#-----------------------------------------------------------------------#
#--------------In Loval machine-----------------------------------------#
#----git clone and tar in the /usr/local/src/ directory-----------------#
#----copy the tar file to download/Build:no directory-------------------#
#-----------------------------------------------------------------------#
        echo "$buildno" > $file
	sudo mkdir -p $path/src
	sudo chown -R devops_bpr:devops_bpr $path/src
	cd $path/src
	sudo rm -rf *
	git clone https://github.com/bathinapullarao/myApp.git
	tar -zcvf $path/src/myApp_$(date +%Y%d%m)_buildnum_$buildno.tar.gz *
	sudo mkdir -p $path/download/Build_$buildno
	sudo chown -R devops_bpr:devops_bpr  $path/download/Build_$buildno
	cp -R $path/src/myApp_* $path/download/Build_$buildno/
#---------------------------------------------------------------------------#
#------------------In Remote machine----------------------------------------#
#----------remoe the old app in myApp and backup directory------------------#
#-copy tar from source sever to destination server and extract in local dir-#
#---------------------------------------------------------------------------#
	ssh $webap "sudo mkdir -p /usr/local/myApp"
	ssh $webap "sudo chown -R devops_bpr:devops_bpr /usr/local/myApp"
	ssh $webap "sudo rm -rf /usr/local/myApp/*"
	ssh $webap "sudo mkdir -p /usr/local/backup/"
	ssh $webap "sudo chown -R devops_bpr:devops_bpr /usr/local/backup"
	ssh $webap "sudo rm -rf /usr/local/backup/*"
	scp -r /usr/local/src/myApp_* $webap:/usr/local/backup/
	ssh $webap "sudo tar -zxvf /usr/local/backup/myApp_* -C /usr/local/"
#---------------------------------------------------------------------------#
#--------else condition to exit the script when the parameters not eq 2-----#
#---------------------------------------------------------------------------#	
else
        echo "Arguments are not equals to 2"
        echo "Aruments should pass in the below format"
        echo "sh deploy.sh destinationServerHostname download"
	echo "here destinationServerHostname in my case test1"
        exit 1
fi

