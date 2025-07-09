local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ -- your plugins here
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-lualine/lualine.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-project.nvim",
        },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { transparent = true },
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        options = { transparent = true },
    },
    { "neovim/nvim-lspconfig" },
    -- Sidebar with tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local function my_on_attach(bufnr)
                local api = require("nvim-tree.api")

                local opts = function(desc)
                    return {
                        desc = "nvim-tree: " .. desc,
                        buffer = bufnr,
                        noremap = true,
                        silent = true,
                        nowait = true,
                    }
                end

                -- Default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- Custom mappings
                vim.keymap.set(
                    "n",
                    "v",
                    api.node.open.vertical,
                    opts("Open: Vertical Split")
                )
                vim.keymap.set(
                    "n",
                    "h",
                    api.node.open.horizontal,
                    opts("Open: Horizontal Split")
                )
                vim.keymap.set(
                    "n",
                    "t",
                    api.node.open.tab,
                    opts("Open: New Tab")
                )
            end

            require("nvim-tree").setup({
                on_attach = my_on_attach,
                view = {
                    width = 30,
                    relativenumber = true,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                },
            })
        end,
    },
    -- bottom terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "horizontal", -- Bottom panel
                size = 15, -- Height of terminal
                open_mapping = [[<C-t>]], -- Key to toggle
                shade_terminals = true,
                insert_mappings = true,
                terminal_mappings = true,
            })
        end,
    },
})
