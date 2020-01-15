#!/bin/sh

# This script will check if all the apss process are up

#apssAPM
ps -eax | grep -i APMDomain | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then 
	echo "apssAPM process is DOWN"
else
	echo "apssAPM process is UP"
fi;

#apssTestDirector

ps -eax | grep -i TestDirector | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssTestDirector process is DOWN"
else
        echo "apssTestDirector process is UP"
fi;

#apssNotyfier
ps -eax | grep -i notifier | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssNotyfier process is DOWN"
else
        echo "apssNotyfier process is UP"
fi;

#apssSmartClient-CRMDomain
ps -eax | grep -i apss | grep -i CRMDomain | grep -v APSSServer >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssSmartClient-CRMDomain process is DOWN"
else
        echo "apssSmartClient-CRMDomain process is UP"
fi;

#apssSmartClient-APSSServer1
ps -eax | grep -i APSSServer1 | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssSmartClient-APSSServer1 process is DOWN"
else
        echo "apssSmartClient-APSSServer1 process is UP"
fi;

#apssSmartClient-APSSServer2
ps -eax | grep -i APSSServer2 | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssSmartClient-APSSServer2 process is DOWN"
else
        echo "apssSmartClient-APSSServer2 process is UP"
fi;

#apssFTS
ps -eax | grep -i hsserver | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssFTS process is DOWN"
else
        echo "apssFTS process is UP"
fi;

#apssFTSERVER
ps -eax | grep -i ftserver | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssFTSERVER process is DOWN"
else
        echo "apssFTSERVER process is UP"
fi;

#apssSelfService
ps -eax | grep -i SelfService |  grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssSelfService process is DOWN"
else
        echo "apssSelfService process is UP"
fi;

#apssRuleManager
ps -eax | grep -i rulemansvc | grep -v grep >/dev/null 2>&1
if [ "$?" -ne "0" ];
then
        echo "apssSelfService process is DOWN"
else
        ps -eax | grep -i rmworkerproces | grep -v grep >/dev/null 2>&1
	if [ "$?" -ne "0" ];
	then
		echo "apssSelfService process is DOWN"
	else
		echo "apssSelfService process is UP"
	fi;
fi;



