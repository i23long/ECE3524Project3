#!/bin/bash
# bash Menu Script

while true
do
echo "---------------------------------"
date
echo "---------------------------------"
echo "Main Menu"
echo "---------------------------------"
PS3='Enter your choice: '
options=("Operating system info" "Hostname and DNS info" "Network info" "Who is online" "Last logged in" "My IP address" "My disk Usage" "My home File-Tree" "Process operations" "Exit")
select opt in "${options[@]}"
do
	case $opt in
		"Operating system info")
			echo "---------------------------------"
			echo "System info"
			echo "---------------------------------"
			echo "Operating system:	$(uname)"
			/usr/bin/lsb_release -a
			read -p "Press enter to continue..."
			break
			;;
		"Hostname and DNS info")
			echo "---------------------------------"
			echo "Hostname and DNS info"
			echo "---------------------------------"
			echo "Hostname:	$(hostname)"
			echo "DNS Domain:	$(domainname)"
			echo "Fully qualified domain name:	$(hostname).$(domainname)"
			echo "Network address (IP):	$(hostname -I)"
			echo "DNS name servers (DNS IP):	$(grep "nameserver" /etc/resolv.conf | cut -d " " -f2)"
			read -p "Press enter to continue..."
			break
			;;
		"Network info")
			echo "---------------------------------"
			echo "Network info"
			echo "---------------------------------"
			typeset -i x
			x=$(ip link show | grep -c "^[0-9]")
			x=$x-1
			echo "Total network interfaces found: $x"
			echo "*** IP Adresses ***"
			echo "$(ip link show)"
			echo "*******************"
			echo "Network rounting"
			echo "******************"
			echo "$(netstat -nr)"
			echo "************************"
			echo "Interface traffic info"
			echo "************************"
			echo "$(netstat -i)"
			read -p "Press enter to continue..."
			break
			;;
		"Who is online")
			echo "---------------------------------"
			echo "Who is online"
			echo "---------------------------------"
			echo "NAME	LINE		TIME	COMMENT"
			echo "$(who)"
			read -p "Press enter to continue..."
			break
			;;
		"Last logged in")
			echo "---------------------------------"
			echo "List of Last logged in users"
			echo "---------------------------------"
			echo "$(last)"
			read -p "Press enter to continue..."
			break
			;;
		"My IP address")
			echo "---------------------------------"
			echo "Public IP info"
			echo "---------------------------------"
			curl ifconfig.co
			read -p "Press enter to continue..."
			break
			;;
		"My disk Usage")
			echo "---------------------------------"
			echo "Disk Usage info"
			echo "---------------------------------"
			du
			read -p "Press enter to continue..."
			break
			;;
		"My home File-Tree")
			echo "<html>
				<head>
				<title>
				Tree of Home directory
				</title>
				</head>
				<body>
				$(tree -H ~ ~ )
				</body>
				</html>" > tree.html
			read -p "File created! Press enter to continue..."
			break
			;;
		"Process operations")
			
			while true
			do
			echo "---------------------------------"
			echo "Process Operations"
			echo "---------------------------------"
			PS3="Enter your choice: "
			option2=("Show all processes" "Kill a process" "Bring up top" "Return to Main Menu")
			select pros in "${option2[@]}"
			do
				case $pros in
					"Show all processes")
						ps aux
						break
						;;
					"Kill a process")
						read -p "Please enter the PID of the process you would like to kill: " pid
						kill -9 $pid
						break
						;;
					"Bring up top")
						top
						;;
					"Return to Main Menu")
						break 2
						;;
					*) 	echo "Invalid input, Please redo."
						break
						;;
				esac
			done
			done
			break
			;;
		"Exit")
			break 2
			;;
		*) 	echo "Invalid input, Please redo."
			break
			;;
	esac
done
done