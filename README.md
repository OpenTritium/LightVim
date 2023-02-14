# LightVim

一个简洁的 Neovim 配置，支持懒启动。

它在设计之初就没打算支持太多格式，并且语言服务器也不打算提供自动安装的方法，我会在下面的文档中手动列出安装语言服务器的方法。

如果你想自定义口味，欢迎 Fork 本仓库。

```tree
.
├── init.lua
├── LICENSE
├── lua
│   ├── configs
│   │   ├── completion.lua
│   │   ├── null-ls.lua
│   │   └── treesitter.lua
│   ├── mappings.lua
│   └── plugins.lua
└── README.md
```

## 软件依赖

### 常规依赖

- git
- curl
- tar

### 语言服务器

> 以下示例基于 ArchLinux 的包管理器 pacman 和 paru

- C / C++

  ```bash
  sudo pacman -S clang
  ```

- lua

  ```bash
  # 使用 luarocks 包管理器安装
  luarocks install --local --server=https://luarocks.org/dev luaformatter # 请确保 ～/.luarocks 存在于环境变量中
  
  # 使用 paru 安装
  paru -S lua-format # 或者你也可以从 AUR 安装
  ```

- C#

  ```bash
  dotnet tool install --global csharp-ls # 你需要 dotnet 环境，并且将 ～/.dotnet/tools 添加到环境变量
  dotnet tool install -g csharpier
  ```

## 功能

### 搜索跳转

> 由 leap.nvim 提供

#### 基础使用

[启动键] + [需要匹配的单词的开头两个字符] + [标识符]

启动键默认是 `s` 或 `S`，其中 `s` 为正向查找，`S` 为反向查找。当你输入需要匹配的两个字符以后，可以输入高亮的标识符来完成跳转。不过你也可以不输入标识符，在你执行下个操作的时候（比如 `i`）会自动跳转到匹配到的第一个位置。

> 你会发现当你输入第一个字符的时候，就已经出现标志符了，但是这个时候输入标识符是徒劳的并且会导致匹配内容出错，提前标注是为了方便让你提前准备好跳转。

#### 可能的疑惑

- 假如需要匹配的内容在行末，导致无法输入足够的两个字符，可以用空格代替换行。
- 键盘上的英文字母一共就 26 个，假如匹配到的对象超过了该数量，可以使用分组。当你输入完匹配内容后，会有两组不同的颜色块，更加鲜艳的就是当前组，颜色暗淡一点的就是下一组，你可以用 `k` 移动到下一组，还可以使用 `j` 移动到上一组。
- 假如你想重复搜索上一次的内容，输入启动键以后再输入 `Enter` 即可。
- 多窗口下使用可以用 `gs` 完成跳转。
- 范围删除可以使用 `dx` 操作符，然后就会出现标识符，会删除到当前光标到选定标识符的位置。

