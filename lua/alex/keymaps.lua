local builtin = require("telescope.builtin")
vim.keymap.set(
    "n",
    "<leader>ff",
    builtin.find_files,
    { desc = "Find Files" }
)
vim.keymap.set(
    "n",
    "<leader>fg",
    builtin.live_grep,
    { desc = "Live Grep" }
)
vim.keymap.set(
    "n",
    "<leader>fb",
    builtin.buffers,
    { desc = "Find Buffers" }
)
vim.keymap.set(
    "n",
    "<leader>fh",
    builtin.help_tags,
    { desc = "Help Tags" }
)
-- nvim-tree bindings
vim.keymap.set(
    "n",
    "<leader>sb",
    ":NvimTreeToggle<CR>",
    { desc = "Toggle File Explorer" }
)
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set(
    "n",
    "<leader>tp",
    ":tabprevious<CR>",
    { desc = "Previous Tab" }
)
vim.keymap.set("n", "<leader>tf", ":tabnext<CR>", { desc = "Next Tab" })

-- End of nvim-tree bindings
-- Terminal bindings
vim.keymap.set(
    "t",
    "<Esc>",
    [[<C-\><C-n>]],
    { desc = "Exit terminal mode" }
)
-- End of terminal bindings
