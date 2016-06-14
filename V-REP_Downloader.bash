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
	CFILE=$(ls | grep *.tar.gz)
	V1="tar xzvf $CFILE"
	V2="rm -f $CFILE"
	sudo -u $SUDO_USER $V1
	sudo -u $SUDO_USER $V2	
	V3="cp ./RobotLib/RobotVREP/vrepAddOnScript_screenRecorder.lua ${CFILE%%.*}"
	echo "$V3"
	sudo -u $SUDO_USER $V3
	cd RobotLib
else
	echo "VREP is already downloaded"
fi