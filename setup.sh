clear
echo -e "
 ▄████▄▓██   ██▓ ▄▄▄▄   ▓█████  ██▀███   ▄▄▄▄   ▓█████ ▄▄▄        ██████ ▄▄▄█████▓
▒██▀ ▀█ ▒██  ██▒▓█████▄ ▓█   ▀ ▓██ ▒ ██▒▓█████▄ ▓█   ▀▒████▄    ▒██    ▒ ▓  ██▒ ▓▒
▒▓█    ▄ ▒██ ██░▒██▒ ▄██▒███   ▓██ ░▄█ ▒▒██▒ ▄██▒███  ▒██  ▀█▄  ░ ▓██▄   ▒ ▓██░ ▒░
▒▓▓▄ ▄██▒░ ▐██▓░▒██░█▀  ▒▓█  ▄ ▒██▀▀█▄  ▒██░█▀  ▒▓█  ▄░██▄▄▄▄██   ▒   ██▒░ ▓██▓ ░ 
▒ ▓███▀ ░░ ██▒▓░░▓█  ▀█▓░▒████▒░██▓ ▒██▒░▓█  ▀█▓░▒████▒▓█   ▓██▒▒██████▒▒  ▒██▒ ░ 
░ ░▒ ▒  ░ ██▒▒▒ ░▒▓███▀▒░░ ▒░ ░░ ▒▓ ░▒▓░░▒▓███▀▒░░ ▒░ ░▒▒   ▓▒█░▒ ▒▓▒ ▒ ░  ▒ ░░   
  ░  ▒  ▓██ ░▒░ ▒░▒   ░  ░ ░  ░  ░▒ ░ ▒░▒░▒   ░  ░ ░  ░ ▒   ▒▒ ░░ ░▒  ░ ░    ░    
░       ▒ ▒ ░░   ░    ░    ░     ░░   ░  ░    ░    ░    ░   ▒   ░  ░  ░    ░      
░ ░     ░ ░      ░         ░  ░   ░      ░         ░  ░     ░  ░      ░           
░       ░ ░           ░                       ░                                   
"

#Check for superuser privileges and branch accordingly!
if (( $EUID != 0 )); then
	print $WARNING "Script is called without superuser privileges!";
	print $INFO "Script will now attempt to enter superuser mode!";
	# Execute setup script with superuser access.
	sudo ./setup.sh;
else
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-";
	echo -e "      _ _            _   
  ___| (_) ___ _ __ | |_ 
 / __| | |/ _ \ '_ \| __|
| (__| | |  __/ | | | |_ 
 \___|_|_|\___|_| |_|\__|
                         
"
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-";
	printf "Please be patient for the entire duration of the script. cyberbeast's minions are putting together a lot of things together! \n \n"

	printf "python3-pip"
	pip3 --version &> /dev/null;
	check_status_code=$?;
	case "$check_status_code" in
		0)	printf " : detected! ";
			;;
		*) 	printf " : not found. Installing NOW! ";
			sudo apt-get install python3-pip;
			;;
	esac
	printf ": DONE! \n"
	
	printf "celery"
	celery --version &> /dev/null;
	check_status_code=$?;
	case "$check_status_code" in
		0)	printf " : detected! ";
			;;
		*) 	printf " : not found. Installing NOW! ";
			sudo pip3 install celery;
			;;
	esac
	printf ": DONE! \n"

	printf "mechanize"
	python3 -m mechanize &> /dev/null;
	check_status_code=$?;
	case "$check_status_code" in
		0)	printf " : detected! ";
			;;
		*)	printf " : not found. Installing NOW! ";
			sudo pip3 install mechanize;
			;;
	esac
	printf ": DONE! \n"

	
fi

