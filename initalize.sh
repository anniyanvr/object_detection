#!/bin/bash

#--------------------------------------------------------------------------------------------------------------#
# File name   : initalize.sh
# File creation : Shwetha Srinivasan : Mon, 26-08-2019 11:36:AM 
# Description :
#				initalise the sript to snap from host machine
#				escape condition is container deletion
# Last Modification : Shwetha Srinivasan : Mon, 26-08-2019 12:15:PM 
#				move the places of logs
#--------------------------------------------------------------------------------------------------------------#

# Executing script as sourcing because we need to set GNUM_ARC variable from /home/docker/code/scripts/numa-arch-check.sh. Soc that we can use it here
imagesnap -t 1 -w 1
