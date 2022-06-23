#!/bin/ksh
########################################################################
# Name: Dead_Clean.sh
# Description : This Script will remove the dead (idle) connections
# Author: PE
########################################################################

##Define Script Location##
. /svw/svwdev1b/.profile
SCRIPT_LOC=$ATA_DATA/PE/scripts/Monitoring

##Getting Hostname##
SERVER="Projectname SVDEV"

##Setting Logfile Location##
outputfile=$SCRIPT_LOC/Dead_Clean.out

#####Mail Details######
mailto='ram.krishnan@mobily.com'

##Remove Old Logs##
if [ -f "$outputfile" ]
then
rm -f $outputfile
fi


## Main Script##

echo -e "\n" >> $outputfile
echo "########################################################################" > $outputfile
echo "                       Dead_Clean at $date                              " >> $outputfile
echo -e  "######################################################################## \n" >> $outputfile

date;>> $outputfile
ecp "biPing&()";>> $outputfile
ecp "biClientMonitor&()";>> $outputfile
date;>> $outputfile


echo -e "\n" >> $outputfile

## Main Script End##

# Checking Output file, mail it.

if [ -f "$outputfile" ]
        then
  echo |mailx -s "Projectname : SVDEV Dead_Clean @ `date`" -v $mailto <$outputfile
 # echo $outputfile
fi
exit 0






