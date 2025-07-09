local function check_exec(name, label)
    if vim.fn.executable(name) == 0 then
        vim.schedule(function()
            vim.notify(
                string.format(
                    "Missing dependency: '%s' (%s)",
                    name,
                    label or name
                ),
                vim.log.levels.WARN
            )
        end)
    end
end

check_exec("rg", "ripgrep (required for Telescope live_grep)")
check_exec("clangd", "C++ LSP backend (for Find Usages)")
check_exec("cmake", "C++ build system (needed for compile_commands.json)")
check_exec("git", "required for plugin downloads")
