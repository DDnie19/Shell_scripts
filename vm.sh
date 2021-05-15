#!/bin/bash
if [ $(ls /opt/ | grep vmware-host-modules) ];
then
	sudo rm -rf /opt/vmware-host-modules
	echo -e "\033[31m vmware-host-modules is deleted!\033[0m"
	echo "Start Download!"
	sudo git clone \
  	-b workstation-$( grep player.product.version /etc/vmware/config | sed '/.*\"\(.*\)\".*/ s//\1/g' ) \
  	https://github.com/mkubecek/vmware-host-modules.git \
  	/opt/vmware-host-modules/
	echo -e "\033[31m Download Finished!\033[0m"
	echo -e "\033[31m Start Make!\033[0m"
	cd /opt/vmware-host-modules/
	sudo make
	sudo make install
	echo "\033[31m Make install Done!\033[0m"
elif [ $(ls /opt/ | grep vmware-host-modules)!=vmware-host-modules ]
	then
		echo -e "\033[31m /opt/vmware-host-modules is Null!\033[0m"
		echo -e "\033[31m Some errors,do some things!\033[0m"
fi
