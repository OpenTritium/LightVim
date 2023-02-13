# LightVim

一个目前只支持 C++ 补全，格式化，诊断的鸡肋 Neovim 配置。

它在设计之初就没打算支持太多格式，如果你想自定义口味，欢迎 Fork 本仓库。

## 软件依赖

- git
- curl
- tar

- clang

目前 C++ 语言服务器实际上是由 Clangd 提供的，所以请：

```bash
sudo pacman -S clang
```