vim.cmd("set nu")
vim.cmd("set rnu")
vim.cmd("set cursorcolumn")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>kd', ':.t.<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ku', ':.t-1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><BS>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', ':tab split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })

