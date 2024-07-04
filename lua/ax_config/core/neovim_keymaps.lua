
-- set keymaps concerning stuff available in core neovim

vim.g.mapleader = " ";
vim.g.maplocalleader = " ";

-- open messages
nmap(
	"<leader>ms",
	"<cmd>messages<CR>",
	{ desc = "open the messages window" },
	"//core/messages"
);

-- netrw
nmap(
	"<leader>e",
	"<cmd>" .. custom_commands["NetrwSidebarToggle"] .. "<CR>",
	{ desc = "open the netrw sidebar" },
	"//core/netrw"
);
nmap(
	"<leader>E",
	"<cmd>" .. custom_commands["NetrwFullToggle"] .. "<CR>",
	{ desc = "open the netrw fullscreen explorer" },
	"//core/netrw"
);

-- live option changes
nmap(
	"<leader>cl",
	"<cmd>" .. custom_commands["ChangeColorColumn"] .. "<CR>",
	{ desc = "change the color column position" },
	"//core/options"
);
nmap(
	"<leader>in",
	"<cmd>" .. custom_commands["ChangeIndentation"] .. "<CR>",
	{ desc = "change indentation style and tab length" },
	"//core/options"
);

-- moving text
-- NOTE: using "<cmd>" instead of ":" breaks these commands
nmap(
	"<M-j>",
	"v:m '>+1<CR>gv=<Esc>",
	{ desc = "move the current line up" },
	"//core/text_editing"
);
nmap(
	"<M-k>",
	"v:m '<-2<CR>gv=<Esc>",
	{ desc = "move the current line down" },
	"//core/text_editing"
);
map(
	"v",
	"<M-j>",
	":m '>+1<CR>gv=<Esc>gv",
	{ desc = "move the selection down" },
	"//core/text_editing"
);
map(
	"v",
	"<M-k>",
	":m '<-2<CR>gv=<Esc>gv",
	{ desc = "move the selection up" },
	"//core/text_editing"
);

-- stationary cursor
nmap(
	"<leader>lc",
	function()
		vim.opt.scrolloff = 999 - vim.o.scrolloff
	end,
	{ desc = "toggles between moving text and moving cursor" },
	"//core/quality_of_life"
);

nmap(
	"J",
	"mzJ`z",
	{ desc = "don't move the cursor when joining the next line" },
	"//core/modification"
);
nmap(
	"<C-d>",
	"<C-d>zz",
	{ desc = "keep the cursor at the center when scrolling down" },
	"//core/modification"
);
nmap(
	"<C-u>",
	"<C-u>zz",
	{ desc = "keep the cursor at the center when scrolling up" },
	"//core/modification"
);
nmap(
	"n",
	"nzzzv",
	{ desc = "keep the cursor at the center navigating search results" },
	"//core/modification"
);
nmap(
	"N",
	"Nzzzv",
	{ desc = "keep the cursor at the center navigating search results" },
	"//core/modification"
);

-- modification/extensions of existing keymaps
map(
	{ "n", "v" },
	"x",
	"\"_x",
	{ desc = "remove character or selection without copying" },
	"//core/modification"
);
map(
	"x",
	"<leader>p",
	"\"_dP",
	{ desc = "paste over selection without copying" },
	"//core/extension"
);
map(
	{ "n", "v" },
	"<leader>y",
	"\"+y",
	{ desc = "yank to system clipboard" },
	"//core/extension"
);
nmap(
	"<leader>Y",
	"\"+Y",
	{ desc = "yank current line to system clipboard" },
	"//core/extension"
);
map(
	{ "n", "v" },
	"<leader>d",
	"\"_d",
	{ desc = "delete without copying" },
	"//core/extension"
);
nmap(
	"<leader>D",
	"\"_D",
	{ desc = "delete till end of line without copying" },
	"//core/extension"
);
map(
	{ "n", "v" },
	"<leader>c",
	"\"_c",
	{ desc = "delete and edit without copying" },
	"//core/extension"
);
nmap(
	"<leader>C",
	"\"_C",
	{ desc = "delete till end of line and edit without copying" },
	"//core/extension"
);
nmap(
	"Y",
	"y$",
	{ desc = "yank text from current character to end of line" },
	"//core/modification"
);

-- split resizing
nmap(
	"-",
	"<cmd>wincmd <<CR>",
	{ desc = "increase window width" },
	"//core/wrapper"
);
nmap(
	"+",
	"<cmd>wincmd ><CR>",
	{ desc = "decrease window width" },
	"//core/wrapper"
);
nmap(
	"<leader>=",
	"<cmd>wincmd +<CR>",
	{ desc = "increase window height" },
	"//core/wrapper"
);
nmap(
	"<leader>-",
	"<cmd>wincmd -<CR>",
	{ desc = "decrease window height" },
	"//core/wrapper"
);

-- substitutions
nmap(
	"<leader>sw",
	"<cmd>" .. custom_commands["SubstituteWordQuick"] .. "<CR>",
	{ desc = "substitute standalone occurences of word under cursor" },
	"//core/substitution"
);
nmap(
	"<leader>sW",
	"<cmd>" .. custom_commands["SubstituteWord"] .. "<CR>",
	{ desc = "substitute standalone occurences of inputted word" },
	"//core/substitution"
);
nmap(
	"<leader>ss",
	"<cmd>" .. custom_commands["SubstituteCharsQuick"] .. "<CR>",
	{ desc = "substitute occurences of character sequence under cursor" },
	"//core/substitution"
);
nmap(
	"<leader>sS",
	"<cmd>" .. custom_commands["SubstituteChars"] .. "<CR>",
	{ desc = "substitute occurences of character sequence inputted" },
	"//core/substitution"
);

-- quick fix list
nmap(
	"<leader>q",
	"<cmd>copen<CR>",
	{ desc = "open the quick fix list" },
	"//core/quality_of_life"
);
nmap(
	"<leader>Q",
	"<cmd>ccl<CR>",
	{ desc = "close the quick fix list" },
	"//core/quality_of_life"
);
nmap(
	"]q",
	"<cmd>cnext<CR>",
	{ desc = "walk forward in the quick fix list" },
	"//core/quality_of_life"
);
nmap(
	"[q",
	"<cmd>cprev<CR>",
	{ desc = "walk backward in the quick fix list" },
	"//core/quality_of_life"
);

-- change fold level
nmap(
	"zf",
	function()
		vim.ui.input(
			{ prompt = "Fold level: " },
			function(input)
				if not input or not input:match("^%-?%d+$") then              -- match statement checks if the input string is a number or not
					return;
				end

				if tonumber(input) > 10 then
					vim.notify(
						"If you want to open all folds, then use " ..
						"zR instead"
					);
				end

				vim.opt.foldlevel = tonumber(input);
			end
		);
	end,
	{ desc = "change the fold level for the current buffer" },
	"//core/quality_of_life"
);

-- lsp keymaps
nmap(
	"gD",
	vim.lsp.buf.declaration,
	{ desc = "goto the declaration of the term under cursor" },
	"//core/lsp"
);
