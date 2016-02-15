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

function worker_setup() {
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-";
	echo -e "
┬ ┬┌─┐┬─┐┬┌─┌─┐┬─┐  ┌─┐┌─┐┌┬┐┬ ┬┌─┐
││││ │├┬┘├┴┐├┤ ├┬┘  └─┐├┤  │ │ │├─┘
└┴┘└─┘┴└─┴ ┴└─┘┴└─  └─┘└─┘ ┴ └─┘┴               
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

	printf "re"
	python3 -m re &> /dev/null;
	check_status_code=$?;
	case "$check_status_code" in
		0)	printf " : detected! ";
			;;
		*)	printf " : not found. Installing NOW! ";
			sudo pip3 install re;
			;;
	esac
	printf ": DONE! \n"

	printf "urllib"
	python3 -m urllib &> /dev/null;
	check_status_code=$?;
	case "$check_status_code" in
		0)	printf " : detected! ";
			;;
		*)	printf " : not found. Installing NOW! ";
			sudo pip3 install urllib;
			;;
	esac
	printf ": DONE! \n"

	printf "csv"
	python3 -m csv &> /dev/null;
	check_status_code=$?;
	case "$check_status_code" in
		0)	printf " : detected! ";
			;;
		*)	printf " : not found. Installing NOW! ";
			sudo pip3 install csv;
			;;
	esac
	printf ": DONE! \n"

	printf "os"
	python3 -m os &> /dev/null;
	check_status_code=$?;
	case "$check_status_code" in
		0)	printf " : detected! ";
			;;
		*)	printf " : not found. Installing NOW! ";
			sudo pip3 install os;
			;;
	esac
	printf ": DONE! \n"

	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-";
}

#Check for superuser privileges and branch accordingly!
if (( $EUID != 0 )); then
	print $WARNING "Script is called without superuser privileges!";
	print $INFO "Script will now attempt to enter superuser mode!";
	# Execute setup script with superuser access.
	sudo ./setup.sh;
else
	echo -e "
██╗    ██╗        ██╗    ███████╗
██║    ██║       ██╔╝    ██╔════╝
██║ █╗ ██║      ██╔╝     ███████╗
██║███╗██║     ██╔╝      ╚════██║
╚███╔███╔╝    ██╔╝       ███████║
 ╚══╝╚══╝     ╚═╝        ╚══════╝
                                 
	"
	printf "Choose responsibly! W(orker) or S(erver)!: ";	
	select response in "W" "S"; do
    case $response in
        W ) worker_setup;;
        S ) server_setup;;
    esac
fi

