#!/bin/bash

ip="192.168.1.20"
file="XW.v6.1.7.32555.180523.1754.bin" 

echo "Ping teste"

#ping test

(( x = 5 ))
(( y = 0 ))
while [[ $x -ne 0 ]]; do
ping -c 1 $ip
	rc=$?
	if [[ $rc -eq 0 ]] ; then
		(( x = 1 ))
		(( y = 1 ))		
	fi
		((x = x - 1)) 
done 			

			if [[ $y -ne 0 ]]; then
				tftp $ip <<- EOF
					bin
					trace
					put $file
					exit
					EOF
						echo "Done"
						echo "Wait until it ping again"
			
				(( x = 20 ))	
				(( z = 0 ))
				while [[ $x -ne 0 ]]; do
					ping -c 1 $ip	
						rc=$?	
						if [[ $rc -eq 0 ]]; then
							(( x = 1 )) 
			  				(( z = 1 ))		
						fi
							(( x = x - 1 ))              
                		done
						
							if [[ $z -ne 0 ]]; then
				       				echo "The device is ready"
			       				fi

			else 
				echo "Please, check the device connection"
			fi


		


