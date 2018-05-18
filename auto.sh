
while ((1));do
   now=`date +"%H%M%S"`
   if [ $now = "015355" ];then
     date > update.md
     sh deploy.sh
     echo "qqqq"
   fi
    echo $now
    sleep 1
done

 
