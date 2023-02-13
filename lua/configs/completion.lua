local cmp = require "cmp"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local mappings = function()
    local keybind = require"mappings".cmp
    return {
        [keybind.select_next_item] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert
        }),
        [keybind.select_prev_item] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert
        }),
        [keybind.scroll_docs_down] = cmp.mapping.scroll_docs(-4),
        [keybind.scroll_docs_up] = cmp.mapping.scroll_docs(4),
        [keybind.complete] = cmp.mapping.complete(),
        [keybind.abort] = cmp.mapping.abort(),
        [keybind.comfirm] = cmp.mapping.confirm({select = true}) -- 显式选择条目
    }
end
cmp.setup({
    -- 注释时关闭补全
    enabled = function()
        local context = require 'cmp.config.context'
        -- 光标在注释区时切换为命令补全模式
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment") and
                       not context.in_syntax_group("Comment")
        end
    end,
    completion = {completeopt = "menu,menuone,noinsert"},
    -- 获取代码片段
    snippet = {
        expand = function(args) require"luasnip".lsp_expand(args.body) end
    },
    -- 从总键位配置中导入
    mapping = cmp.mapping.preset.insert(mappings()),
    -- 代码片段提供源
    sources = cmp.config.sources({
        {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"},
        {name = "path"}
    }, {{name = 'buffer'}})
})
-- 方法名自动匹配括号
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- nvim 命令补全
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

