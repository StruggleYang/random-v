#!/bin/bash
echo "==== commit id ====="
gid=$(git rev-parse --short=7 HEAD)
echo $gid
echo -e "runing [cnpm || npm install]······"
cnpm install || { echo -e "run [cnpm install] faild, try run [ npm install ]"; npm install; };
echo "==== runing [npm run build] ===="
npm run build
echo "==== copy dist to docker/apps ===="
mkdir docker/apps
cp -R dist docker/apps
cd docker
docker build -t struy.luo/random-v:1.0.0 .
echo "==== clear apps ===="
rm -rf apps
echo "==== successful build! ===="