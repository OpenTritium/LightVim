return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        opts = require "configs.treesitter",
        event = {"BufReadPost", "BufNewFile"},
        -- 加载时自动触发的配置器,这里是因为模块名跟插件名不一样需要手动触发
        config = function(_, opts)
            require"nvim-treesitter.configs".setup(opts)
        end
    }, {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        config = function() require "configs.completion" end,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "nvim-lua/plenary.nvim",
            "saadparwaiz1/cmp_luasnip", "windwp/nvim-autopairs"
        }
    }, {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require"lspconfig".clangd.setup {}
            require"lspconfig".lua_ls.setup {}
            require"lspconfig".csharp_ls.setup {}
        end
    }, {
        "jose-elias-alvarez/null-ls.nvim",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function() require "configs.null-ls" end
    }, {"nvim-autopairs", event = "VeryLazy", config = true}, {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function() vim.cmd([[colorscheme catppuccin]]) end
    }, {"beauwilliams/statusline.lua"}, {
        "ggandor/leap.nvim",
        dependencies = {"tpope/vim-repeat"},
        config = function()
            require('leap').add_default_mappings()
            local keybind = require"mappings".leap
            require("leap").opts.special_keys = keybind
        end
    }
}
