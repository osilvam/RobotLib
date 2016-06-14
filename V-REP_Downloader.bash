if ! [ $(ls -d ../*/ | grep V-REP) ]
	then
	cd ..
	if [ $(arch) == "x86_64" ]
		then
		echo "Downloading V-REP 64 bits simulator"
		sudo -u $SUDO_USER wget 'http://coppeliarobotics.com/V-REP_PRO_EDU_V3_3_1_64_Linux.tar.gz'
	else
		echo "Downloading V-REP 32 bits simulator"
		sudo -u $SUDO_USER 'wget http://coppeliarobotics.com/V-REP_PRO_EDU_V3_3_1_Linux.tar.gz'
	fi
	sudo -u $SUDO_USER 'tar xzvf V-REP*.tar.gz'
	sudo -u $SUDO_USER 'rm -f V-REP*.tar.gz'
	cd RobotLib
else
	echo "VREP is already downloaded"
fi