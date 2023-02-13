# LightVim

一个目前只支持 C++ 补全，格式化，诊断，其余都是原汁原味的鸡肋 Neovim 配置。

它在设计之初就没打算支持太多格式，并且语言服务器也不打算提供自动安装的方法，我会在下面的文档中手动列出安装语言服务器的方法。

如果你想自定义口味，欢迎 Fork 本仓库。

## 软件依赖

- git
- curl
- tar

- clang

目前 C++ 语言服务器实际上是由 Clangd 提供的，所以请：

```bash
sudo pacman -S clang
```