vim.cmd("set nu")
vim.cmd("set rnu")
vim.cmd("set cursorcolumn")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false

vim.opt.scrolloff = 8

-- copy and paste to down/up
vim.keymap.set('n', '<leader>kd', ':.t.<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ku', ':.t-1<CR>', { noremap = true, silent = true })

-- new tab and move between tabs
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><BS>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', ':tab split<CR>', { noremap = true, silent = true })

-- move by half page up/down with jufify to middle
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- find and justify to the middle
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- copy to clipboard
vim.api.nvim_set_keymap('n', 'Y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'Y', '"+y', { noremap = true, silent = true })

-- move between tmux windows and panes
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- to escape from the holy grave of insert mode just use jj
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })

-- to save file
vim.api.nvim_set_keymap('n', '<leader>w', ':w!<CR>', { noremap = true, silent = true })



--- greatest remaps of my life
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>:v=gv")


vim.keymap.set("x", "<leader>p", "\"_dP")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
