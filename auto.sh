
while ((1));do
   now=`date +"%H%M%S"`
   if [ $now = "020515" ];then
     echo "==============start============" >> log.md
     sh deploy.sh  >> log.md
     echo "==============end============" >> log.md
   fi
    #echo $now 
    sleep 1
done

 