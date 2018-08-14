
time=`date '+%Y%m%d'`
hexo new post $time-$1
hexo clean
hexo g
hexo server
