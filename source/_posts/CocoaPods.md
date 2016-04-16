---
title: CocoaPods应用介绍
date: 2015-07-28 21:31:42 
description: 关于CocoaPod的安装与简单的使用介绍
categories: 开发助手
tags: [CocoaPods] 
toc: true
comments: true 
---


## 安装与配置

### 安装前准备

1. 更换ruby源（被墙了）
```
gem sources --remove https://rubygems.org/
gem sources -a http://ruby.taobao.org/
gem sources -l
```

2. 更新ruby
```
sudo gem update --system
```

#### 安装CocoaPods
```
sudo gem install cocoapods
```
#### 索引CocoaPods
```
pod setup
```
*注：所有项目文件都托管在https://github.com/CocoaPods/Specs*,执行`pod setup`时会把podspecs索引文件克隆到本地的`~/.cocoapods`目录下，文件大，更新慢*

有开发者在`gitcafe`和`oschina`上建立了CocoaPods索引系统
```
pod repo remove master
pod repo add master https://gitcafe.com/akuandev/Specs.git
pod repo update
```

## 使用CocoaPods

### 搜索库
```
pod search 关键词
```

### 使用

#### 创建
1. 切换到工程目录
```
pod init
```
会创建默认的`podfile`文件
2. 手动创建`podfile`文件

#### 设置应用支持最低版本
```
platform : iOS, "8.0"
```

#### 增加依赖
```
pod 'JSONKit', '~>1.4'
pod 'AFNetWorking', '2.2.1'
pod 'Reachability'
```
#### 安装依赖
```
pod install
```
可以添加参数查看详细执行过程
```
pod install --verbose
```
### 补充

#### podfile.lock文件
执行 `pod install`之后，还会生成一个`podfile.lock`文件，应该把它加入到版本库中，因为它会锁定当前各依赖库的版本，之后多次执行`pod install`不会更改版本，除非执行`pod update`才会修改`podfile.lock`,在团队中防止各自库版本不同

所以如果不需要升级库，即使添加了新的依赖也只是执行`pod install`,除非要升级未指定版本的库到最新版本，执行`pod update`,也可以在`podfile`文件中执行最新版本

#### podSpecs更新
CocoaPods 在执行`pod install`和`pod update`时会默认先更新podspec索引，可以使用`--no-repo-update`参数禁止其做索引的更新
```
pod install --no-repo-update
pod update --no-repo-update
```

#### podfile 与target
可以一个工程中的不同的target使用不同的pods依赖库,如果没有指定，则会对工程中的第一个target使用依赖
```
target: 'First' do 
......
end

target: 'Second' do 
......
end
```



