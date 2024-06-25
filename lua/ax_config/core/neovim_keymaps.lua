-- neovim_keymaps.lua
-- set keymaps concerning stuff available in core neovim

vim.g.mapleader = " ";
vim.g.maplocalleader = " ";

-- netrw
nmap("<leader>e", ":" .. custom_commands["NetrwSidebarToggle"] .. "<CR>");
nmap("<leader>E", ":" .. custom_commands["NetrwFullToggle"] .. "<CR>");

-- moving text
map("v", "J", ":m '>+1<CR>gv=<Esc>gv");                                       -- move selected text one line up
map("v", "K", ":m '<-2<CR>gv=<Esc>gv");                                       -- move selected text one line down

-- stationary cursor
nmap("J", "mzJ`z");
nmap("<C-d>", "<C-d>zz");
nmap("<C-u>", "<C-u>zz");
nmap("n", "nzzzv");
nmap("N", "Nzzzv");

-- extensions of existing keymaps
map({ "n", "v" }, "x", "\"_x");                                               -- *delete without copying
map("x", "<leader>p", "\"_dP");                                               -- paste without copying
map({ "n", "v" }, "<leader>y", "\"+y");                                       -- yank to clipboard
nmap("<leader>Y", "\"+Y");                                                    -- yank line to clipboard
map({ "n", "v" }, "<leader>d", "\"_d");                                       -- delete without copying
nmap("<leader>D", "\"_D");                                                    -- delete till the end of the line without copying
