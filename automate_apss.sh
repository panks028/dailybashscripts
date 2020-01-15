#/bin/sh
process=$1
case $process in
	'apssAPM' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/APMDomain/bin/startWebLogic.sh"	
	;;
	'apssTestDirector' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/TestDirector/bin/startWebLogic.sh"
	;;
	'apssNotyfier' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/scripts/startNOTFY.sh"
	;;
	'apssSmartClient-CRMDomain' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/CRMDomain/bin/startWebLogic.sh"
	;;
	'apssSmartClient-APSSServer1' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/CRMDomain/bin/startManagedWebLogic.sh APSSServer1"
	;;
	'apssSmartClient-APSSServer2' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/CRMDomain/bin/startManagedWebLogic.sh APSSServer2"
	;;
	'apssFTS' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/scripts/startHSSRV.sh"
	;;
	'apssFTSERVER' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/scripts/startFTS.sh"
	;;
	'apssSelfService' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/SelfService/bin/startWebLogic.sh"
	;;
	'apssRuleManager' )
		/usr/bin/su - apss -c "nohup /prjvl01/apss/scripts/startRM.sh"
	;;
esac
