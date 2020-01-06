#!/bin/bash

echo "welcome to anonimizer"



optionSelected=5;

while [[ $optionSelected -ne 0 ]]; do
		#statements
	echo "select an option number to continue" 
	echo -e "\033[0;32m 1)install configuration \033[0m"	
	echo -e "\033[0;34m 2)configuration already installed \033[0m"
	echo -e "\033[0;31m 0)exit program \033[0m"
	read optionSelected	
		
	if [ $optionSelected -eq 1 ]
		then
	    	echo -e "\033[0;35m		please wait until the setup finishes \033[0m"
	    	sudo apt-get install tor
			sudo systemctl start tor
			sudo systemctl enable tor
			git clone https://github.com/ruped24/toriptables2
			cd toriptables2/
			sudo mv toriptables2.py /usr/local/bin/
			cd
			echo -e "\033[0;32m +++++++++++++++++++ setup finished you can start using anonimizer now +++++++++++++++++++\033[0m"

 
	elif [ $optionSelected -eq 2 ]
		then
			optionNested=5;
	    	while [[ $optionNested -ne 0 ]]; do
	    		#statements
	    		printf "\n"
	    		echo -e '\033[0;33m		1)show current ip \033[0m'
				echo -e "\033[0;32m		2)change ip \033[0m"
				echo -e "\033[0;34m		3)return to default ip \033[0m"
				echo -e "\033[0;31m		0)exit menu \033[0m"
				read optionNested
		
				if [ $optionNested -eq 1 ]
					then
					curl suip.biz/ip/
				elif [ $optionNested -eq 2 ]
					then
					sudo toriptables2.py -l
				elif [ $optionNested -eq 3 ]
					then
					sudo toriptables2.py -f
				elif [ $optionNested -eq 0 ] 
					then
						#statements
						break	
				fi
			done
	elif [ $optionSelected -eq 0 ]
		 then
			echo -e "\033[0;36m ********************* happy anonymous surfing ********************* \033[0m"
			break
	else
	    echo "option not available please try again"
	fi

done