#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd .vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git config --global user.name "yuxiaoy1(bot)"
git config --global user.email "1032897296@qq.com"

git init
git add -A
git commit -m 'deploy: $(date "+DATE: %Y-%m-%d TIME: %H:%M:%S")'

# 如果发布到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f https://yuxiaoy1:${GITHUB_TOKEN}@github.com/yuxiaoy1/awesome-newsletters.git master:gh-pages

cd -
rm -rf .vuepress/dist