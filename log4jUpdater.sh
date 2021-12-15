YUM_CMD=$(which yum 2>&1 >/dev/null)
APT_GET_CMD=$(which apt-get 2>&1 >/dev/null)
GET_DPKG_LOG4J=$(dpkg -l | grep log4j 2>&1 >/dev/null)
GET_YUM_LOG4J=$(rpm -ql log4j 2>&1 >/dev/null)

echo " "

which yum 2>&1 >/dev/null 2>/dev/null
if [[ $? -eq 0 ]]; then
   echo "############################## Using YUM for package management."
fi   
which apt-get 2>&1 >/dev/null 2>/dev/null
if [[ $? -eq 0 ]]; then
   echo "############################## Using APT-GET for package management."
fi

echo "############################## Checking Log4j if installed..."

if [[ ! -z $YUM_CMD ]]; then
	if [[ ! -z $GET_DPKG_LOG4J ]]; then
		echo " "
		echo "############################## Updating Log4j..."
		echo " "
	else
		echo " "
		echo "############################## Installing Log4j..."
		echo " "
	fi
	sudo yum install -y log4j 2>&1 >/dev/null 2>/dev/null
elif [[ ! -z $APT_GET_CMD ]]; then
	echo " "
	echo "############################## Updating packages...."
	echo " "
	sudo apt update
	if [[ ! -z $GET_DPKG_LOG4J ]]; then
		echo " "
		echo "############################## Updating Log4J..."
		echo " "
	else
		echo " "
		echo "############################## Installing Log4J..."
		echo " "
	fi
	sudo apt install -y liblog4j2-java 2>&1 >/dev/null 2>/dev/null
fi

rpm -ql log4j 2>&1 >/dev/null 2>/dev/null
if [[ $? -eq 0 ]]; then
	echo " "
	echo "############## Log4j Installed/Updated. Here is the version recently installed."
	echo "############## Any 1.X version, or versions >=2.15.0 is secure against CVE-2021-44228!"
	echo " "
	rpm -ql log4j
	echo " "
	echo "############################## Log4J Installation/Update completed."
	echo " "
	exit 0
fi

dpkg -l | grep log4j 2>&1 >/dev/null 2>/dev/null
if [[ $? -eq 0 ]]; then
	echo " "
	echo "############## Log4j Installed/Updated. Here is the version recently installed."
	echo "############## Any 1.X version, or versions >=2.15.0 is secure against CVE-2021-44228!"
	echo " "
	dpkg -l | grep log4j
	echo " "
	echo "############################## Log4J Installation/Update completed."
	echo " "
	exit 0
fi

echo " "
echo "############## no version of log4j seems to have been installed, please check if the system version has the log4j or liblog4j2-java package available for installation."
echo " "
exit 1