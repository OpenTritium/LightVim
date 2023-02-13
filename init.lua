local opt = vim.opt
local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- 未安装插件管理器则安装
if not vim.loop.fs_stat(lazypath) then
    fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
opt.rtp:prepend(lazypath)
require"lazy".setup("plugins") -- 加载插件列表
