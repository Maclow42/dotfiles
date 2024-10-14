-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)


vim.keymap.set('n', '\\', ':w<CR>', opts)
vim.keymap.set('n', ' qq', ':q<CR>', opts)
vim.keymap.set('n', ' qw', ':wq<CR>', opts)
vim.keymap.set('n', ' qf', ':qf!<CR>', opts)
vim.keymap.set('n', ' qa', ':qa!<CR>', opts)


vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', opts)


vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('n', '<C-\\>', ':split | terminal<CR>:resize 10<CR>a', opts)
-----------------
-- Insert mode --
-----------------

vim.keymap.set('i', 'jj', '<ESC>', opts)
vim.keymap.set('i', 'ww', '<ESC>:w<CR>a', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)