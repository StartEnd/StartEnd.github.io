generate #生成静态整站
cd ./public #生成的静态页面会存储在public目录下
git init
git config --global push.default matching
git config --global user.email "858965877@qq.com" #填入GitHub的邮箱地址
git config --global user.name "StartEnd" #填入GitHub的用户名
git add --all .
git commit -m "Travis CI Auto Builder" #自动构建后的内容将全部以此信息提交
git push --quiet --force https://${0f50c7816694b46f309ef9599dab2bfec9a3b5a1}@github.com/StartEnd/StartEnd.io.git master  #自动构建后的内容将全部以此信息提交
##curl --connect-timeout 20 --max-time 30 -s http://远端服务器URL/webhook.php?_=${NOTIFY_TOKEN} #服务器Webhook 将在下文介绍
