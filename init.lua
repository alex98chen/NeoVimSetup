vim.g.mapleader = " "
require("alex.check_dependencies")
require("alex.options")
require("alex.lazy")
require("alex.keymaps")
vim.cmd.colorscheme("nightfox")

-- Format lua files
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = function()
        local filepath = vim.fn.expand("%:p")
        vim.cmd("silent! write") -- save first to disk
        vim.fn.system({ "/usr/local/bin/stylua", filepath })
        vim.cmd("edit!") -- reload the file to reflect formatting changes
    end,
})
