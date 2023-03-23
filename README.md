# random-v
by @华仔
> A Vue.js project

![](http://img.struy.cn/18-12-11/72114207.jpg)
![](http://img.struy.cn/18-12-11/8319763.jpg)

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```

## docker run app
```
# build image
sh dockerBuild.sh

# run
docker run --name random-v  -p 8668:80 -d  struy.luo/random-v:1.0.0
```
> open http://127.0.0.1:8668 

## push to demo branch

```
# 强制添加dist文件夹，因为.gitignore文件中定义了忽略该文件
git add -f dist

# 提交到本地暂存区
git commit -m 'Initial the page of project'

# 部署dist目录下的代码
git subtree push --prefix dist origin gh-pages
```
>注：使用git subtree命令可以在同一分支上维护源代码以及构建代码，在部署时仅仅推送dist目录下的内容。
