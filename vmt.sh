for host in $(cat servertools); do scp /home/pankasha/vmtools-script $host:/tmp && ssh $host
OUT=$?
if [ $OUT -eq 0 ];then
/tmp/vmtools-script
else
echo "No Success"
fi
done
