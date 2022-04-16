#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

echo -e '\033[32;40m

  ____        U  ___ u    ____      ____     U _____ u   __   __
 / __"| u      \/"_ \/ U /"___|u U |  _"\ u  \| ___"|/   \ \ / /
<\___ \/       | | | | \| |  _ /  \| |_) |/   |  _|"      \ V /
 u___) |   .-,_| |_| |  | |_| |    |  _ <     | |___     U_|"|_u
 |____/>>   \_)-\___/    \____|    |_| \_\    |_____|      |_|
  )(  (__)       \\\\      _)(|_     //   \\\\_   <<   >>  .-,//|(_
 (__) .github.io(__)    (__)__)   (__)  (__) (__) (__)  \_) (__)  
 
'

echo -e "\033[32;40m [1/3] \033[0m commit 2 main branch"

git init
git add -A
git commit -m "💖 ${1}."

# 如果你想要部署到 https://USERNAME.github.io
git push -f git@github.com:Sogrey/vue3-vite-ts-template.git main

echo -e "\033[32;40m [2/3] \033[0m building..."

npm run build && cd dist

echo -e "\033[32;40m [3/3] \033[0m deploy to github pages..."

git init
git add -A
git commit -m "🚀 deploy github pages."

# 如果你想要部署到 https://USERNAME.github.io
git push -f git@github.com:Sogrey/vue3-vite-ts-template.git main:gh-pages

echo -e "\033[32;40m done \033[0m "
