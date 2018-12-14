# random-v
by @华仔
> A Vue.js project

![](http://www.struy.top/18-12-11/72114207.jpg)
![](http://www.struy.top/18-12-11/8319763.jpg)

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```
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