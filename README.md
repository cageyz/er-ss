# EdgeRouter shadowsocks 集成工具
## 简介
本项目是 EdgeRouter 的 shadowsocks 的集成安装工具，包含两个主要开源组件：

- [ChinaDNS](https://github.com/shadowsocks/ChinaDNS) 1.3.2
- [Shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev) 2.2.4

## 安装方法

将安装包上传到路由器上，将安装包解压缩，运行下面命令

```
sudo -i

chmod 755 erl-ss
cd erl-ss
./install.sh

```
