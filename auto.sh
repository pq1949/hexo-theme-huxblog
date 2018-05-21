
while ((1));do
   now=`date +"%H%M%S"`
   if [ $now = "015815" ];then
     echo "==============start============"
     date
     sh deploy.sh 
     date 
     echo "================end============" 
   fi
    #echo $now 
    sleep 1
done

 
