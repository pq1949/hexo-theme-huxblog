cd ~
. .bash_profile
date > /home/leo/gitRepo/hexo-theme-huxblog/update.md
cd /home/leo/gitRepo/hexo-theme-huxblog/
git pull

hexo clean
hexo g
hexo d

git status
git add .
git commit -m "new"
git push
git status

