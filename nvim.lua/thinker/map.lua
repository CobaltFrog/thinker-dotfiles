local lg_opt = { noremap = true, silent = true } -- l(ocal)g(lobal) option

local function map(mode, lhs, rhs, opts_arg, desc_arg)
    local opts = {}

    if type(opts_arg) == "table" then
        for k, v in pairs(opts_arg) do
            opts[k] = v
        end
    elseif type(opts_arg) == "string" then
        opts.desc = opts_arg
    end

    if desc_arg ~= nil then
        opts.desc = desc_arg
    end

    vim.keymap.set(mode, lhs, rhs, opts)
end

-- MAPPINGS --
map('n', 't', ':NvimTreeToggle<CR>', lg_opt, "Toggle files tree")

-- buffer 
map('n', '<leader>j', ':bnext<CR>', lg_opt, "Switch to next buffer")
map('n', '<leader>k', ':bprevious<CR>', lg_opt, "Switch to previous buffer")
map('n', '<C-s>', ':write<CR>', lg_opt, "Write buffer to current file")

-- split movement
map("n", "<C-h>", "<C-w>h", "Move left")
map("n", "<C-j>", "<C-w>j", "Move down")
map("n", "<C-k>", "<C-w>k", "Move up")
map("n", "<C-l>", "<C-w>l", "Move right")

-- clipboard
map('n', '<leader>r', '"+', lg_opt, "Start command for '+' register")
map('v', '<leader>c', '"+y', lg_opt, "Copy to clipboard")
map('n', '<leader>c', '"+yy', lg_opt, "Copy line to clipboard")
map('n', '<leader>v', '"+p', lg_opt, "Paste from clipboard after cursor")
map('n', '<leader>V', '"+P', lg_opt, "Paste from clipboard before cursor")
