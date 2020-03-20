#!/bin/bh




/* path='/usr/local'                                                       
webap=$1
file=$path/$2/buildno.txt
buildno=$(cat $file | awk '{printf "%s", $1}')
buildno=$((buildno+1)) 
if [ "$#" -eq 2 ]; then
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
	ssh $webap "sudo mkdir -p /usr/local/myApp"
	ssh $webap "sudo chown -R devops_bpr:devops_bpr /usr/local/myApp"
	ssh $webap "sudo rm -rf /usr/local/myApp/*"
	ssh $webap "sudo mkdir -p /usr/local/backup/"
	ssh $webap "sudo chown -R devops_bpr:devops_bpr /usr/local/backup"
	ssh $webap "sudo rm -rf /usr/local/backup/*"
	scp -r /usr/local/src/myApp_* $webap:/usr/local/backup/
	ssh $webap "sudo tar -zxvf /usr/local/backup/myApp_* -C /usr/local/"
else
        echo "Arguments are not equals to 2"
        echo "Aruments should pass in the below format"
        echo "sh deploy.sh destinationServerHostname download"
	echo "here destinationServerHostname in my case test1"
        exit 1
fi  /*

